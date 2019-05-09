class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404(e = nil)
    logger.info "Rendering 404 with exception: #{e.message}" if e
    render file: Rails.root.join('public/500.html'), status: 500, layout: false, content_type: 'text/html'
  end

end
