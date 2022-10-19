require 'rails_helper'

describe 'Usuario visita página de veículos' do
  it 'e verifica que há veículo cadastrado' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    #act
    login_as(user)
    visit work_orders_path
    click_on 'Veículos'
    #assert
    expect(page).to have_content vehicle.license_plate
  end

  it 'e que veículo encontra-se disponível' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    #act
    login_as(user)
    visit work_orders_path
    click_on 'Veículos'
    #assert
    expect(page).to have_content vehicle.license_plate
    expect(page).to have_content 'Em manutenção: Não'
    expect(page).to have_content 'Disponível: Sim'
  end

  it 'e que se for alocado para atender uma ordem de serviço, ficará indisponível' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 300, minimum_weight:1, 
                                        maximum_weight:20000, fee:500)
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 1000, distance: 100)
    weight_config = WeightConfiguration.create!(minimum_weight: 1, maximum_weight: 1000, price: 100, shipping_type: shipping_type)
    price_per_distance_config = PricePerDistanceConfiguration.create!(minimum_distance: 1, maximum_distance: 300, 
                                                                      price_per_distance: 100, shipping_type: shipping_type)
    delivery_time_config = DeliveryTimeConfiguration.create!(minimum_distance: 1, maximum_distance: 300, delivery_time: 24, 
                                                            shipping_type: shipping_type)
    #act
    login_as(user)
    visit work_orders_path
    click_on work_order.code
    click_on 'Selecionar'
    click_on 'Iniciar ordem de serviço'
    click_on 'Veículos'
    #assert
    expect(page).to have_content vehicle.license_plate
    expect(page).to have_content 'Em manutenção: Não'
    expect(page).to have_content 'Disponível: Não'
  end

  it 'e que, ao encerrar uma ordem de serviço, volta a ficar disponível' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 300, minimum_weight:1, 
                                        maximum_weight:20000, fee:500)
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 1000, distance: 100)
    weight_config = WeightConfiguration.create!(minimum_weight: 1, maximum_weight: 1000, price: 100, shipping_type: shipping_type)
    price_per_distance_config = PricePerDistanceConfiguration.create!(minimum_distance: 1, maximum_distance: 300, 
                                                                      price_per_distance: 100, shipping_type: shipping_type)
    delivery_time_config = DeliveryTimeConfiguration.create!(minimum_distance: 1, maximum_distance: 300, delivery_time: 24, 
                                                            shipping_type: shipping_type)
    #act
    login_as(user)
    visit work_orders_path
    click_on work_order.code
    click_on 'Selecionar'
    click_on 'Iniciar ordem de serviço'
    click_on 'Finalizar ordem de serviço'
    click_on 'Veículos'
    #assert
    expect(page).to have_content vehicle.license_plate
    expect(page).to have_content 'Em manutenção: Não'
    expect(page).to have_content 'Disponível: Sim'
  end

  it 'e que se estiver em manutenção, não será possível selecioná-lo para atender uma ordem de serviço' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 300, minimum_weight:1, 
                                        maximum_weight:20000, fee:500)
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434', maintenance: true)
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 1000, distance: 100)
    weight_config = WeightConfiguration.create!(minimum_weight: 1, maximum_weight: 1000, price: 100, shipping_type: shipping_type)
    price_per_distance_config = PricePerDistanceConfiguration.create!(minimum_distance: 1, maximum_distance: 300, 
                                                                      price_per_distance: 100, shipping_type: shipping_type)
    delivery_time_config = DeliveryTimeConfiguration.create!(minimum_distance: 1, maximum_distance: 300, delivery_time: 24, 
                                                            shipping_type: shipping_type)
    #act
    login_as(user)
    visit work_orders_path
    click_on work_order.code
    click_on 'Selecionar'
    click_on 'Iniciar ordem de serviço'
    #assert
    expect(page).to have_content 'Não há veículos disponíveis para atender a ordem de serviço no momento.'
  end
end
