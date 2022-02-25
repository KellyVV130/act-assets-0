class RoomsController < ApplicationController
  before_action :set_room, only:[:show, :update, :destroy]
  # TODO 这里不一定，也可以在update和destroy函数中查找？看页面的设计逻辑？还是与页面无关，只看传过来的id参数？

  # GET /rooms
  def index
    @rooms = Room.all.order :name
    json_response(@rooms)
  end

  # POST /rooms
  def create # 接收post请求并新建房间并存入数据库
    @room = Room.create!(room_params)
    json_response(@room, :created)
  end

  # GET /rooms/:id
  def show
    json_response(@room)
  end

  # PUT /rooms/:id
  def update
    @room.update(room_params)
    head :no_content
    # json_response(@room, :updated) TODO 可以这么写吗???
  end

  # DELETE /rooms/:id
  def destroy
    @room.destroy
    head :no_content
  end

  private
  def room_params
    params.require(:room).permit(:name, :coords)
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
