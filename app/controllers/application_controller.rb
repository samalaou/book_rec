class ApplicationController < ActionController::Base
  include Authentication
  before_action :authenticated?
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def redirect_with_notice(condition, path, success_message, failure_message)
    if condition
      redirect_to path, notice: success_message
    else
      redirect_to path, alert: failure_message
    end
  end
end
