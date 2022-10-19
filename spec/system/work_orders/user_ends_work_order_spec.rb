require 'rails_helper'

describe 'Usuario visita página de detalhes da ordem de serviço e a finaliza' do
  it 'dentro do prazo' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 1000, distance: 100)
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 300, minimum_weight:1, maximum_weight:20000, fee:500)
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    weight_config = WeightConfiguration.create!(minimum_weight: 1, maximum_weight: 1000, price: 100, shipping_type: shipping_type)
    price_per_distance_config = PricePerDistanceConfiguration.create!(minimum_distance: 1, maximum_distance: 300, price_per_distance: 100, shipping_type: shipping_type)
    delivery_time_config = DeliveryTimeConfiguration.create!(minimum_distance: 1, maximum_distance: 300, delivery_time: 24, shipping_type: shipping_type)

    #act
    login_as(user)
    visit work_orders_path
    click_on work_order.code
    click_on 'Selecionar'
    click_on 'Iniciar ordem de serviço'
    click_on 'Finalizar ordem de serviço'
    #assert
    expect(page).not_to have_button 'Iniciar ordem de serviço'
    expect(page).not_to have_button 'Finalizar ordem de serviço'
    expect(page).not_to have_button 'Editar'
    expect(page).to have_content 'Ordem de serviço finalizada!'
    expect(page).to have_content 'Status: Entregue'
    expect(page).to have_content 'Veículo: ASD3434'
    expect(page).to have_content "Prazo: #{I18n.localize(work_order.reload.date)}"
    expect(page).to have_content "Data de início: #{I18n.localize(Date.today)}"
    expect(page).to have_content "Data de finalização: #{I18n.localize(Date.today)}"
  end
  
  it 'fora do prazo' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 300, minimum_weight:1, 
                                        maximum_weight:20000, fee:500)
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    late_work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                        product_code: 'GHFJ123450', product_weight: 1000, distance: 10, status: :on_the_way, 
                                        shipping_type: shipping_type, vehicle: vehicle, price: 100, start_date: Date.today - 2.day, 
                                        date: Date.today - 1.day)
    #act
    login_as(user)
    visit work_orders_path
    click_on late_work_order.code
    click_on 'Finalizar ordem de serviço'
    #assert
    expect(current_path).to eq work_order_late_path(late_work_order)
    expect(page).to have_content 'Ordem de serviço atrasada.'
    expect(page).to have_content 'Justificativa do atraso:'
  end

  it 'fora do prazo, e preenche justificativa' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 300, minimum_weight:1, 
                                        maximum_weight:20000, fee:500)
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    late_work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                        product_code: 'GHFJ123450', product_weight: 1000, distance: 10, status: :on_the_way, 
                                        shipping_type: shipping_type, vehicle: vehicle, price: 100, start_date: Date.today - 2.day, 
                                        date: Date.today - 1.day)
    #act
    login_as(user)
    visit work_orders_path
    click_on late_work_order.code
    click_on 'Finalizar ordem de serviço'
    fill_in 'Justificativa do atraso:', with: 'Carro quebrou no caminho.'
    click_on 'Salvar'
    #assert
    expect(current_path).to eq work_order_path(late_work_order)
    expect(page).to have_content 'Justificativa de atraso adicionada.'
    expect(page).to have_content 'Justificativa de atraso: Carro quebrou no caminho.'
  end

  it 'fora do prazo, e preenche justificativa em branco' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 300, minimum_weight:1, 
                                        maximum_weight:20000, fee:500)
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    late_work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                        product_code: 'GHFJ123450', product_weight: 1000, distance: 10, status: :on_the_way, 
                                        shipping_type: shipping_type, vehicle: vehicle, price: 100, start_date: Date.today - 2.day, 
                                        date: Date.today - 1.day)
    #act
    login_as(user)
    visit work_orders_path
    click_on late_work_order.code
    click_on 'Finalizar ordem de serviço'
    fill_in 'Justificativa do atraso:', with: ' '
    click_on 'Salvar'
    #assert
    expect(current_path).to eq work_order_late_path(late_work_order)
    expect(page).to have_content 'Insira justificativa para o atraso na entrega!!!'
  end
end

