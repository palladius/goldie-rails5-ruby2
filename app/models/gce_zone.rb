class GceZone < ApplicationRecord
  #belongs_to :GceRegion
  belongs_to :gce_region

  validates :name,  :presence => true, format: { with: /\A[a-z]+-[a-z]+\d+-[a-z]\z/, 
    	message: "Use following format: $CONTINENT-$POSITION$DIGITS-$ALPHA (all lowercase), e.g. 'antarctica-west42-f'"}
  validates_uniqueness_of :name

  def to_s
  	name
  end

  def validate
    z = self.name
    r = self.gce_region.name
    # ASSERT z starts with r
    raise "Wrong name! R(#{r}) <=> Z(#{z})" unless z.start_with?(r)
  end

  def self.create_by_region_and_suffix(region, suffix)
    # Example: Region("antarctica-west42"), 'a' => "antarctica-west42-a" zne
    # TODO(ricc): validate region is a GceRegion
    # TODO(ricc): validate suffix is a /[a-z]/
    #assert_match(/[a-z]/, suffix)
    #assert_instance_of GceRegion, region
    
    GceZone.create(name: region.name + "-" + suffix, gce_region_id: region.id, is_active: region.is_active)
  end

end
