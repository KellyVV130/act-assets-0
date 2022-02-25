class SeatsController < ApplicationController
  before_action :set_seat, only:[:show, :update, :destroy]

  # GET /seats
  def index
    @seats = Seat.all.order :name
    json_response(@seats)
  end

  # POST /seats
  def create # 接收post请求并新建房间并存入数据库
    @seat = Seat.create!(seat_params)
    json_response(@seat, :created)
  end

  # GET /seats/:id
  def show
    json_response(@seat)
  end

  # PUT /seats/:id
  def update
    @seat.update(seat_params)
    head :no_content
    # json_response(@seat, :updated) TODO 可以这么写吗???
  end

  # DELETE /seats/:id
  def destroy
    @seat.destroy
    head :no_content
  end

  private
  def seat_params
    params.require(:seat).permit(:name, :coords)
  end

  def set_seat
    @seat = Seat.find(params[:id])
  end
end
