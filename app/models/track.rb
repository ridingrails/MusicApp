class Track < ActiveRecord::Base

  STATUS = %w{ bonus regular }

  attr_accessible :name, :album_id, :status, :lyrics
  validates_presence_of :name, :album_id, :status
  validates :status, :inclusion => STATUS

  belongs_to(
    :album,
    :primary_key => :id,
    :foreign_key => :album_id,
    :class_name => "Album"
  )
end