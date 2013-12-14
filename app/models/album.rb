class Album < ActiveRecord::Base

  TYPES = %w{ live studio }

  attr_accessible :name, :band_id, :recording
  validates_presence_of :name, :band_id, :recording
  validates :recording, :inclusion => TYPES

  belongs_to(
    :band,
    :primary_key => :id,
    :foreign_key => :band_id,
    :class_name => "Band"
  )

  has_many(
    :tracks,
    :primary_key => :id,
    :foreign_key => :album_id,
    :class_name => "Track",
    :dependent => :destroy
  )

end