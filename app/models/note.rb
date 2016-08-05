class Note < ActiveRecord::Base
  validates :author_id, :track_id, :comment, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: "User"

  belongs_to :track,
    primary_key: :id,
    foreign_key: :track_id,
    class_name: "Track"


end