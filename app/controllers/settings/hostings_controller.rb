class Settings::HostingsController < ApplicationController
  # implement the comments here...
end

=begin

before_action :verify_hosting_mode

  def show
  end

  def update
    if all_updates_valid?
      hosting_params.keys.each do |key|
        Setting.send("#{key}=", hosting_params[key].strip)
      end

      redirect_to settings_hosting_path, notice: t(".success")
    else
      flash.now[:error] = @errors.first.message
      render :show, status: :unprocessable_entity
    end
  end

  def send_test_email
    unless Setting.smtp_settings_populated?
      flash[:alert] = t(".missing_smtp_setting_error")
      render(:show, status: :unprocessable_entity)
      return
    end

    begin
      NotificationMailer.with(user: Current.user).test_email.deliver_now
    rescue => _e
      flash[:alert] = t(".error")
      render :show, status: :unprocessable_entity
      return
    end

    redirect_to settings_hosting_path, notice: t(".success")
  end

  private
    def all_updates_valid?
      @errors = ActiveModel::Errors.new(Setting)
      hosting_params.keys.each do |key|
        setting = Setting.new(var: key)
        setting.value = hosting_params[key].strip

        unless setting.valid?
          @errors.merge!(setting.errors)
        end
      end

      if hosting_params[:upgrades_mode] == "auto" && hosting_params[:render_deploy_hook].blank?
        @errors.add(:render_deploy_hook, t("settings.hostings.update.render_deploy_hook_error"))
      end

      @errors.empty?
    end

    def hosting_params
      permitted_params = params.require(:setting).permit(:render_deploy_hook, :upgrades_mode, :email_sender, :app_domain, :smtp_host, :smtp_port, :smtp_username, :smtp_password, :require_invite_for_signup)

      result = {}
      result[:upgrades_mode] = permitted_params[:upgrades_mode] == "manual" ? "manual" : "auto" if permitted_params.key?(:upgrades_mode)
      result[:render_deploy_hook] = permitted_params[:render_deploy_hook] if permitted_params.key?(:render_deploy_hook)
      result[:upgrades_target] = permitted_params[:upgrades_mode] unless permitted_params[:upgrades_mode] == "manual" if permitted_params.key?(:upgrades_mode)
      result.merge!(permitted_params.slice(:email_sender, :app_domain, :smtp_host, :smtp_port, :smtp_username, :smtp_password, :require_invite_for_signup))
      result
    end

    def verify_hosting_mode
      head :not_found unless self_hosted?
    end

=end
