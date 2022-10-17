require 'rails_helper'

describe 'Usuario visita tela inicial' do
  it 'e vê o nome da app' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 10000, distance: 100)
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:20000, fee:500)

    #act
    login_as(user)
    visit work_orders_path
    click_on work_order.code
    click_on 'select'
    #assert
    expect(page).to have_content 'Modalidade de transporte adicionada.'
    expect(page).to have_content "Modalidade de transporte: Motoboy - #{work_order.price}"
  end
end