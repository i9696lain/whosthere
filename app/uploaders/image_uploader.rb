require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :processing # allows hooking into promoting
  plugin :versions   # enable Shrine to handle a hash of files
  plugin :delete_raw # delete processed files after uploading
  plugin :validation_helpers

  process(:store) do |io, context|
    versions = { original: io } # retain original

    io.download do |original|
      pipeline = ImageProcessing::MiniMagick.source(original)

      versions[:small]  = pipeline.resize_to_limit!(100, 100)

    end

    versions # return the hash of processed files
  end

  Attacher.validate do
    validate_max_size 5 * 1024 * 1024, message: '5MBを超える画像はアップロードできません。'
    validate_mime_type_inclusion %w(image/jpeg image/png)
  end

end