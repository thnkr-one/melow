class CurrenciesController < ApplicationController
  def show
    currency = Money::Currency.all_instances.find {
      |currency| currency.iso_code == params[:id]
    }
    render json: currency.as_join.merge(
      { step: currency.step }
    )
  end
end
