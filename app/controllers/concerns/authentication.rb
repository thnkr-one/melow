module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :set_request_details
    before_action :authenticate_user!
  end

  class_methods do
    def skip_authentication(**options)
      skip_before_action :authenticate_user!, **options
    end
  end

private

  def authenticate_user!
    if session_record = Session.find_by_id(cookies.signed[:session_token])
      Current.session = session_record
    else
      redirect_to new_session_url
    end
  end

  def create_session_for(user)
    session = user.sessions.create!
    cookies.signed.permanent[:session_token] = { value: session.id, httponly: true }
    session
  end

  def set_request_details
    Current.user_agent = request.user_agent
    Current.ip_address = request.ip
  end
end
