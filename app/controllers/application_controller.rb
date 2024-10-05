class ApplicationController < ActionController::Base
  include Localize, AutoSync, Authentication, Invitable, SelfHostable, StoreLocation
  include Pagy::Backend
  allow_browser versions: :modern

  private

  def with_sidebar
    return "turbo_rails/frame" if turbo_frame_request?
    "with_sidebar"
  end
end
