# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin 
asia-east1	a, b, c	Changhua County, Taiwan
asia-east2	a, b, c	Hong Kong
asia-northeast1	a, b, c	Tokyo, Japan
asia-south1	a, b, c	Mumbai, India
asia-southeast1	a, b, c	Jurong West, Singapore
australia-southeast1	a, b, c	Sydney, Australia
europe-north1	a, b, c	Hamina, Finland
europe-west1	b, c, d	St. Ghislain, Belgium
europe-west2	a, b, c	London, England, UK
europe-west3	a, b, c	Frankfurt, Germany
europe-west4	a, b, c	Eemshaven, Netherlands
northamerica-northeast1	a, b, c	Montréal, Québec, Canada
southamerica-east1	a, b, c	São Paulo, Brazil
us-central1	a, b, c, f	Council Bluffs, Iowa, USA
us-east1	b, c, d	Moncks Corner, South Carolina, USA
us-east4	a, b, c	Ashburn, Northern Virginia, USA
us-west1	a, b, c	The Dalles, Oregon, USA
us-west2	a, b, c	Los Angeles, California, USA
=end

GceRegion.create(name: 'southamerica-east1', address: 'São Paulo, Brazil', default_zones: 'a,b,c')
GceRegion.create(name: 'southamerica-east1', address: 'São Paulo, Brazil', default_zones: 'a,b,c') # should fail as name is taken
#GceZone.create(name: 'southamerica-east1-a')
#GceZone.create(name: 'southamerica-east1-b')
#GceZone.create(name: 'southamerica-east1-c')

# Autogenerate from Regions.txt FILE.
f = File.open("#{Rails.root}/db/regions.txt" ).readlines()
f.each do |line|
  region_name, commasep_zones, address = line.split("\t")
  r = GceRegion.create(
    name: region_name, 
    address: address,
    description: "db.see taken from ragions.txt (cut and pasted from: https://cloud.google.com/compute/docs/regions-zones/ )",
    default_zones: commasep_zones,
  )
  print "New region: #{r}\n"
  r.save
end

# Sample zones

sample_region = GceRegion.first


print "rake db:seed completed!\n"