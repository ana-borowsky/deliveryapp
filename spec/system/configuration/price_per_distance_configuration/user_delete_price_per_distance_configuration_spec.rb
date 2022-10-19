require 'rails_helper'
describe 'Usuário remove uma configuração de preço por distância percorrida' do
  it 'com sucesso' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:20000, fee:500)
    config = PricePerDistanceConfiguration.create!(minimum_distance: 10, maximum_distance: 20, price_per_distance: 123, shipping_type: shipping_type)
    #act
    login_as(user)
    visit work_orders_path
    click_on 'Configurações'
    click_on 'Configurações de preço por distância percorrida'
    click_on 'Remover'
    #assert
    expect(current_path).to eq price_per_distance_configurations_path
    expect(page).to have_content 'Configuração removida com sucesso!'
    expect(page).not_to have_content '10km'
    expect(page).not_to have_content '20km'
  end
end