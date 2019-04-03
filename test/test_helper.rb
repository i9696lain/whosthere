ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  # roomにログイン中ならtrueを返す
  def is_logged_in?
    !session[:room_id].nil?
  end

  def log_in(room)
    session[:room_id] = room.id
  end

end

class ActionDispatch::IntegrationTest

  def log_in(room, password: 'password')
    post room_login_path(room), params: { session: { password: password } }
  end

end
