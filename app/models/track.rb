class Track < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: "Album"
end
