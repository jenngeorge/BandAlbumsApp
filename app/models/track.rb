class Track < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: "Album"

  has_manny :notes,
    primary_key: :id,
    foreign_key: :track_id,
    class_name: "Note"
end
