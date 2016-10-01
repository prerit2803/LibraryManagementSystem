class BookingsController < ApplicationController
  layout 'nav'

  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all.where(["b_date > ?", "#{Date.today}"])
    if session[:user_usertype] == 2
      @bookings = Booking.where(["b_date >= ? and user_id = ?", "#{Date.today}", "#{current_user.id}"])
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)

    if session[:user_usertype] == 2
      @booking.user_id = current_user.id
    end
    #@booking.room_id = @room.id

    if @booking.save
      TrackBooking.create!(:full_name=>@booking.user.full_name, :email=>@booking.user.email, :room_no=>@booking.room.room_no, :size=>@booking.room.size, :lib_name=>@booking.room.lib_name, :b_date=>@booking.b_date, :from_time=>@booking.from_time, :to_time=>@booking.to_time, :status=>'Booked', :booked_by=>session[:user_id], :booking_id=>@booking.id)
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
      if @booking.update(booking_params)
        track = TrackBooking.find_by(booking_id: @booking.id)
        track.update_attributes(:full_name=>@booking.user.full_name, :email=>@booking.user.email, :room_no=>@booking.room.room_no, :size=>@booking.room.size, :lib_name=>@booking.room.lib_name, :b_date=>@booking.b_date, :from_time=>@booking.from_time, :to_time=>@booking.to_time, :status=>'Booking Updated', :booked_by=>session[:user_id], :booking_id=>@booking.id)
        redirect_to @booking, notice: 'Booking was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    track = TrackBooking.find_by(booking_id: @booking.id)
    @booking.destroy
    track.update_attribute(:status, 'Cancelled')
      redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:b_date, :from_time, :to_time, :status, :room_id, :user_id)
    end
end
