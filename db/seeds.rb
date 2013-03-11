# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Country.count == 0
  countries = Country.create([
    { name: 'Deutschland', code: 'de' },
    { name: 'United Kingdom', code: 'gb' },
    { name: 'United States', code: 'us' },
    { name: 'Australia', code: 'au' }
  ])
end

if Provider.count == 0
  de = Country.find_by_code('de')
  us = Country.find_by_code('us')

  providers = Provider.create([
    { name: 'Vodafone D2', country: de },
    { name: 'Kabel Deutschland', country: de },
    { name: 'Deutsche Telekom', country: de },
    { name: 'O2', country: de },
    { name: 'Verizon', country: us },
    { name: 'AT&T', country: us },
    { name: 'Optimum', country: us },
    { name: 'Cable Vision', country: us },
    { name: 'Vodafone UK', country: gb },
    { name: 'O2', country: gb },
    { name: 'Everything Everywhere', country: gb },
    { name: 'Tesco Mobile', country: gb },
    { name: 'Giffgaff', country: gb }
  ])
end