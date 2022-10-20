require 'rails_helper'

describe 'Usuário não autenticado busca por uma ordem de serviço' do
  it 'e ela está pendente' do
    #arrange
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 100', delivery_address: 'Avenida dos Cáctos, 300', 
                                    product_code: 'HJUH123450', product_weight: 10000, distance: 10)
    #act
    visit root_path
    fill_in 'Insira o código da ordem de serviço', with: work_order.code
    click_on 'Buscar'
    #assert
    expect(page).to have_content "Resultado da busca por: #{work_order.code}"
    expect(page).to have_content 'Endereço de saída: Rua das Laranjeiras, 100'
    expect(page).to have_content 'Endereço de entrega: Avenida dos Cáctos, 300'
    expect(page).to have_content 'Código do produto: HJUH123450'
    expect(page).to have_content 'Peso do produto: 100kg'
    expect(page).to have_content 'Distância: 10km'
    expect(page).to have_content 'Status: Pendente'
  end

  it 'e ela está atrasada' do
    #arrange
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 300, minimum_weight:1, 
                                        maximum_weight:20000, fee:500)
    vehicle = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                        product_code: 'GHFJ123450', product_weight: 1000, distance: 10, status: :late, 
                                        shipping_type: shipping_type, vehicle: vehicle, price: 100, start_date: Date.today - 2.day, 
                                        date: Date.today - 1.day, end_date: Date.today, delay_cause: 'Veículo sofreu avarias no caminho.')
    #act
    visit root_path
    fill_in 'Insira o código da ordem de serviço', with: work_order.code
    click_on 'Buscar'
    #assert
    expect(page).to have_content 'Status: Atrasada'
    expect(page).to have_content 'Justificativa do atraso: Veículo sofreu avarias no caminho.'
    expect(page).to have_content "Data de início: #{I18n.localize(Date.today - 2.day)}"
    expect(page).to have_content "Prazo: #{I18n.localize(Date.today - 1.day)}"
    expect(page).to have_content "Data de finalização: #{I18n.localize(Date.today)}"
    expect(page).to have_content 'Veículo: Honda CG - ASD3434'
  end
end





