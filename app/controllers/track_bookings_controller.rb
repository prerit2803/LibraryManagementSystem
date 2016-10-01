class TrackBookingsController < ApplicationController
  layout 'nav'

  def index
    @trackbookings = TrackBooking.all.where(["b_date < ?", "#{Date.today}"])
  end
end
