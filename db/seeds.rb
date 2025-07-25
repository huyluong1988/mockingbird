# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_or_create_by!(
  email: "testuser@example.com"
) do |u|
  u.first_name = "Test"
  u.last_name = "User"
  u.password = "password123"
end

# Create a test task for the user
Task.create!(
  title: "Sample Task",
  description: "This is a sample task for seeding.",
  due_date: Date.today + 7.days,
  status: 'active',
  user: user
)
