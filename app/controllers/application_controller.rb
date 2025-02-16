class ApplicationController < ActionController::Base
  include Authentication
  before_action :authenticated?
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def redirect_with_notice(condition, success_path, success_message, failure_message, failure_path = nil)
    if condition
      redirect_to success_path, notice: success_message
    else
      redirect_to (failure_path || success_path), alert: failure_message
    end
  end
end
