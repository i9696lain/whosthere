require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"

if Rails.env.production?
  bucket = 'whosthere'
else
  bucket = 'whosthere-dev'
end

s3_options = {
  access_key_id:     ENV['WT_AWS_ACCESSKEY'],
  secret_access_key: ENV['WT_AWS_SECRETKEY'],
  region:            'ap-northeast-1',
  bucket:            bucket }

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "#{Rails.env}/cache", **s3_options),
  store: Shrine::Storage::S3.new(prefix: "#{Rails.env}/store", **s3_options)}

# 使用するプラグインの宣言
Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data