class RoomsController < ApplicationController
  layout 'nav'

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
    @rooms = @rooms.search(params[:search]) if params[:search].present?
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @room = Room.find(params[:id])
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    @room = Room.new(room_params)
    if @room.save
      redirect_to @room
    else
      render 'new'
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
      redirect_to @room
    else
      render 'edit'
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to rooms_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:room_no, :size, :lib_name, :status)
    end
end
