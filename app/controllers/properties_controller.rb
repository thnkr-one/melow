class PropertiesController < ApplicationController
  before_action :set_account, only: :update

  def create
    account = Current.family
                     .accounts
                     .create_with_optional_start_balance! \
                       attributes: account_params.except(:start_date, :start_balance),
                       start_date: account_params[:start_date],
                       start_balance: account_params[:start_balance]
    account.sync_later
    redirect_to account, notice: t(".success")
  end

  def update
    @account.update!(account_params)
    @account.sync_later
    redirect_to @account, notice: t(".success")
  end

private

  def set_account
    @account = Current.family.accounts.find(params[:id])
  end

  def account_params
    params.require(:account)
          .permit(
            :name, :balance, :start_date, :start_balance, :currency, :accountable_type,
            accountable_attributes: [
                                      :id,
                                      :year_built,
                                      :area_unit,
                                      :area_value,
                                      address_attributes: [ :line1, :line2, :locality, :region, :country, :postal_code ]
                                    ]
          )
  end
end
