class EquipmentsController < ApplicationController
  before_action :set_equipment, only:[:show, :update, :destroy]
  # TODO 这里不一定，也可以在update和destroy函数中查找？看页面的设计逻辑？还是与页面无关，只看传过来的id参数？

  # GET /equipments
  def index
    # @equipments = Equipment.all
    json_response(Equipment.all)
  end

  # POST /equipments
  def create # 接收post请求并新建设备并存入数据库
    # @equipment = Equipment.new(equipment_params)
    #
    # @equipment.save
    @equipment = Equipment.create!(equipment_params)
    json_response(@equipment, :created)
  end

  # GET /equipments/:id
  def show
    json_response(@equipment)
  end

  # PUT /equipments/:id
  def update
    @equipment.update(equipment_params)
    head :no_content
    # json_response(@equipment, :updated) TODO 可以这么写吗???
  end

  # DELETE /equipments/:id
  def destroy
    @equipment.destroy
    head :no_content
  end

  private
  def equipment_params
    params.require(:equipment).permit(:equipment_number, :allocated_since)
  end

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end
end
