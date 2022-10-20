require 'rails_helper'
describe 'Usuario busca por uma ordem de serviço' do
  it 'a partir do menu' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
    #act
    login_as(user)
    visit work_orders_path
    #assert
    within('header nav') do
      expect(page).to have_field('Insira o código da ordem de serviço')
      expect(page).to have_button('Buscar')
    end
  end
  it 'e encontra uma ordem de serviço' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
    work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 2000', delivery_address: 'Avenida dos Cáctos, 3000', 
                                  product_code: 'GHFJ123450', product_weight: 10000, distance: 100)
    #act
    login_as(user)
    visit work_orders_path
    fill_in 'Insira o código da ordem de serviço', with: work_order.code
    click_on 'Buscar'
    #assert
    expect(page).to have_content "Resultado da busca por: #{work_order.code}"
    expect(page).to have_content "Código: #{work_order.code}"
    expect(page).to have_content "Endereço de saída: Rua das Laranjeiras, 2000"
    expect(page).to have_content "Endereço de entrega: Avenida dos Cáctos, 3000"
    expect(page).to have_content "Código do produto: GHFJ123450"
    expect(page).to have_content "Distância: 100km"
    expect(page).to have_content "Peso do produto: 100kg"
    expect(page).to have_button('Buscar')
  end
end