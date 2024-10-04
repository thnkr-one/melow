# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
StoreType.destroy_all
Order.destroy_all

store_types = ["In-store", "Online"]
store_types.each do |type|
  StoreType.create(name: type)
end

months = %w[January February March April May June July August September October November December]
store_types = StoreType.all

(2023..2024).each do |year|
  months.each do |month|
    store_types.each do |store_type|
      Order.create(
        store_type: store_type,
        month: month,
        year: year,
        amount: Faker::Number.between(from: 100, to: 500)
      )
    end
  end
end
