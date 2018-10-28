class GceRegion < ApplicationRecord
  # attr_accessible :address, :name, :description
  has_many :zones


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

#    $ rails generate model Comment commenter:string body:text post:references
end
