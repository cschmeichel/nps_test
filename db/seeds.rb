# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
10.times do
  User.create(
      first_name: FFaker::Name.first_name,
      last_name: FFaker::Name.last_name
  )
end
