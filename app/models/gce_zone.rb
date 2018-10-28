class GceZone < ApplicationRecord
  #belongs_to :GceRegion
  belongs_to :gce_region

  validates :name,  :presence => true, format: { with: /\A[a-z]+-[a-z]+\d+-[a-z]\z/, 
    	message: "Use following format: $CONTINENT-$POSITION$DIGITS-$ALPHA (all lowercase), e.g. 'antarctica-west42-f'"}
  validates_uniqueness_of :name

  def to_s
  	name
  end
end
