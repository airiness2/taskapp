class ApplicationController < ActionController::Base
  http_basic_authenticate_with :name => ENV['USER'], :password => ENV['PASS'] if Rails.env == "production"

  protect_from_forgery with: :exception
  include SessionsHelper

  class Forbidden < ActionController::ActionControllerError
  end

  rescue_from Forbidden, with: :rescue403

  private

  def rescue403(err)
    @exception = err
    render template: 'errors/forbidden', status: 403
  end
end
