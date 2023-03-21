# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Doorkeeper::Application.count.zero?
    Doorkeeper::Application.create!(uid: "4yjjpaCuS2hZYYEPxNuh2nHD0d_7Joq_IplecZadulw",name: 'Nails Client', redirect_uri: '', scopes: '')
  end
Provice.new(id: "33b358ef-a701-4650-95e2-3013035f806d",name: "TP HCM", districts:[District.new(id: "49a047d2-2679-4d48-83ee-b63ee17c6f37",name: "Bình Thạnh",wards: [Ward.new(id: "ac8322c0-8984-43ef-be87-c60e5b26910e",name: "Phường 26")])] ).save