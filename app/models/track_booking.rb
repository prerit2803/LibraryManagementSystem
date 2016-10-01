class TrackBooking < ApplicationRecord


  def self.search(search)
    if search
      self.where(["room_no = ? or full_name like ? or size = ? or lib_name like ?", "#{search}".to_i ,"%#{search}%","#{search}".to_i, "%#{search}%"])
    else
      self.all
    end
  end

end
