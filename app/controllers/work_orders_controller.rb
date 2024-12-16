class WorkOrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:search]
  skip_before_action :allow_admin_only, only: [:search, :index, :show,:pending, :select_shipping_type, :start, :end, :late, :late_cause]
  before_action :set_work_order, only:[:show, :edit, :update, :end_work_order]

  def index
    @work_orders = WorkOrder.all
  end

  def new
    @work_order = WorkOrder.new
  end

  def create
    @work_order = WorkOrder.new(work_order_params)
    if @work_order.save()
      redirect_to work_orders_path, notice: 'Ordem de serviço cadastrada com sucesso!'
    else
      flash.now[:notice] = 'Ordem de serviço NÃO cadastrada!'
      render 'new'
    end
  end

  def show
    @available_shipping_types = ShippingType.where("minimum_distance <= ?", @work_order.distance)
                                  .where("maximum_distance >= ?", @work_order.distance)
                                  .where("minimum_weight <= ?", @work_order.product_weight)
                                  .where("maximum_weight >= ?", @work_order.product_weight)
                                  .where(active: true)
  end

  def edit
  end

  def update
    if @work_order.update(work_order_params)
      redirect_to work_order_path(@work_order.id), notice: 'Ordem de serviço editada com sucesso!'
    else
      flash.now[:notice] = 'Não foi possível atualizar a ordem de serviço.'
      render 'edit'
    end
  end

  def search
    @code = params['query']
    @work_orders = WorkOrder.where("code LIKE ?", "%#{@code}%")
  end

  def pending
    @pending_work_orders = WorkOrder.where(status: :pending)
  end

  def select_shipping_type
    @work_order = WorkOrder.find(params[:work_order_id])
    @work_order.shipping_type = ShippingType.find(params[:shipping_type_id])
    @work_order.price = @work_order.shipping_type.calculate_price(@work_order.distance, @work_order.product_weight)
    if !@work_order.price
      redirect_to work_order_path(@work_order.id), notice: 'Não foi possível calcular o preço.'
      return
    end
    if @work_order.save
      redirect_to work_order_path(@work_order.id), notice: 'Modalidade de transporte adicionada.'
    else
      flash.now[:notice] = 'Não foi possível adicionar a modalidade de transporte.'
    end
  end

  def start
    @work_order = WorkOrder.find(params[:work_order_id])
    delivery_time = @work_order.shipping_type.calculate_delivery_time(@work_order.distance)
    if !delivery_time
      redirect_to work_order_path(@work_order.id), notice: 'Prazo não atendido por nenhuma modalidade de transporte. Ordem de serviço não pode ser iniciada.'
      return
    end
    @work_order.date = Date.today + delivery_time.hours
    @available_vehicle = Vehicle.where(available: true)
                                .where(maintenance: false)
                                .first
    if !@available_vehicle
      redirect_to work_order_path(@work_order.id), notice: 'Não há veículos disponíveis para atender a ordem de serviço no momento.'
      return
    end
    @available_vehicle.available = false
    @available_vehicle.save
    @work_order.vehicle = @available_vehicle
    @work_order.status = 'on_the_way'
    @work_order.start_date = Date.today
    if @work_order.save
      redirect_to work_order_path(@work_order.id), notice: 'Ordem de serviço iniciada!'
    else
      flash.now[:notice] = 'Não foi possível iniciar ordem de serviço.'
    end
  end

  def end
    @work_order = WorkOrder.find(params[:work_order_id])
    @work_order.end_date = Date.today
    if @work_order.end_date > @work_order.date
      @work_order.update(status: :late)
      redirect_to work_order_late_path(@work_order.id), notice: 'Ordem de serviço finalizada com atraso!'
      return
    else
      @work_order.status = 'delivered'
      redirect_to work_order_path(@work_order.id), notice: 'Ordem de serviço finalizada!'
    end
    @work_order.vehicle.update(available: true)
    @work_order.save!
  end

  def late
    @work_order = WorkOrder.find(params[:work_order_id])
    if @work_order.status != 'late'
      redirect_to work_orders_path, notice: 'Você não tem autorização para acessar essa página!'
    end
  end

  def late_cause
    @work_order = WorkOrder.find(params[:work_order_id])
    @work_order.delay_cause = params[:delay_cause]
    if !@work_order.delay_cause.strip.empty?
      @work_order.save
      redirect_to work_order_path(@work_order.id), notice: 'Justificativa de atraso adicionada.'
    else
      redirect_to work_order_late_path(@work_order.id), notice: 'Insira justificativa para o atraso na entrega!!!'
    end
  end

  private

  def work_order_params
    params.require(:work_order).permit(:pickup_address, :delivery_address, :product_code, :product_weight, :distance, :date, :status, :shipping_type, :vehicle, :start_date, :end_date, :delay_cause)
  end

  def set_work_order
    @work_order = WorkOrder.find(params[:id])
  end
end