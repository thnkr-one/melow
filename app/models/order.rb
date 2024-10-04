# == Schema Information
#
# Table name: orders
#
#  id            :uuid             not null, primary key
#  amount        :integer
#  month         :string
#  year          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  store_type_id :uuid             not null
#
# Indexes
#
#  index_orders_on_store_type_id  (store_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_type_id => store_types.id)
#
class Order < ApplicationRecord
  belongs_to :store_type
end
