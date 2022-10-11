class WorkOrdersController < ApplicationController
  before_action :set_work_order, only:[:show]

  def index
    @work_orders = WorkOrder.all
  end

  def new
    @work_order = WorkOrder.new
  end

  def create
    @work_order = WorkOrder.new(work_order_params)
    if @work_order.save()
      redirect_to root_path, notice: 'Ordem de serviço cadastrada com sucesso!'
    else
      flash.now[:notice] = 'Ordem de serviço NÃO cadastrada! Preencha todos os campos.'      
      render 'new'
    end
  end

  private

  def work_order_params
    params.require(:work_order).permit(:pickup_address, :delivery_address, :product_code, :product_weight, :distance)
  end
  
  def set_work_order
    @work_order = WorkOrder.find(params[:id])
  end
end