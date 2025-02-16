class ThemeController < ApplicationController
  allow_unauthenticated_access
    def update
      cookies[:theme] = params[:theme]
      redirect_to(request.referrer || root_path)
    end
end
