# == Schema Information
#
# Table name: store_types
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class StoreType < ApplicationRecord
end
