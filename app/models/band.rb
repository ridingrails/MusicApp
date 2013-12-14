class Band < ActiveRecord::Base

  attr_accessible :name
  validates :name, :presence => true

  has_many(
    :albums,
    :primary_key => :id,
    :foreign_key => :band_id,
    :class_name => "Album",
    :dependent => :destroy
  )

  has_many(
    :tracks,
    :through => :albums,
    :source => :tracks
  )
end