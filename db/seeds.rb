# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

countries = Country.create([{ name: 'Deutschland', code: 'de' }, { name: 'France', code: 'fr' }])
Provider.create(name: 'Kabel Deutschland', country: countries.first)
User.create(ip: '127.0.0.1')