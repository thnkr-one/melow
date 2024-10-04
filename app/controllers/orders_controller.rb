class OrdersController < ApplicationController
  def index
    @orders = Order.includes(:store_type).group(:month, :store_type_id).sum(:amount)

    store_types = StoreType.all.index_by(&:id)
    render json: @orders.map { |(month, store_type_id), amount| { month: month, store_type: store_types[store_type_id].name, amount: amount } }
  end
end