class GceRegion < ApplicationRecord
  # attr_accessible :address, :name, :description
  has_many :gce_zones


  validates :name,  :presence => true, format: { with: /\A[a-z]+-[a-z]+\d+\z/, 
    	message: "Use following format: $CONTINENT-$POSITION$DIGITS (all lowercase), e.g. 'antarctica-west42'"}
  validates_uniqueness_of :name
  #validates :title, :presence => true, :length => { :minimum => 5 }
  #validates :default_zones, presence: true, 
	#    create_table :gce_regions do |t|
    #  t.string :name
    #  t.string :address
    #  t.text :description
    #  t.boolean :is_active, default: TRUE
    #  also added default_zones :string
  def continent
    name.split('-')[0]
  end

  # syntactic sugar but soooo rubyish!
  def is_active?
  	is_active
  end

  def to_s
  	return_value = name
  	return_value += " (INACTIVE)" unless is_active?
  	return_value
  end

  def zones
  	gce_zones
  end

  def validate
    gce.zones.each {|z| z.validate }

  end

  def autocreate_child_zones
  	zones = self.default_zones.split(",").map{|x| x.strip } # ['a','b','c']
  	zones.each do |z| 
  	  return_value = GceZone.create_by_region_and_suffix(self, z) # .save
  	  print "Creating zone #{z} for Region #{self}... #{return_value}\n"
	end
  end

#    $ rails generate model Comment commenter:string body:text post:references
end
