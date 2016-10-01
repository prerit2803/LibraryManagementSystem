class Room < ApplicationRecord
  has_many :bookings, :dependent => :destroy

  validates :room_no,  presence: true
  validates :size,  presence: true
  validates :lib_name, presence: true

  def self.search(search)
    if search
      self.where(["room_no = ? or size = ? or lib_name like ? or status like ?", "#{search}".to_i, "#{search}".to_i ,"%#{search}%","%#{search}%"])
    else
      self.all
    end
  end
end
