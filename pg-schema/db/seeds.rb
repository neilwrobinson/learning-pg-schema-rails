# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Organization.destroy_all


Organization.create!([{
    id: '1',
    name: "M3",
    created_at: Time.now,
    updated_at: Time.now
},
{
    id: '2',
    name: "O3",
    created_at: Time.now,
    updated_at: Time.now
}])

Order.destroy_all

Order.create!([{
    id: '1',
    name: "Order One",
    address: "1 Fake Street",
    email: "example@example.com",
    created_at: Time.now,
    updated_at: Time.now

},
{
    id: '2',
    name: "Order Two",
    address: "2 Fake Street",
    email: "example2@example.com",
    created_at: Time.now,
    updated_at: Time.now 
}
])