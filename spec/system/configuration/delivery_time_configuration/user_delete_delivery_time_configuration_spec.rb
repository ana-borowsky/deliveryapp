require 'rails_helper'
describe 'Usuário remove uma configuração de prazo' do
  it 'com sucesso' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    shipping_type = ShippingType.create!(name: 'Motoboy', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:20000, fee:500)
    config = DeliveryTimeConfiguration.create!(minimum_distance: 10, maximum_distance: 20, delivery_time: 123, shipping_type: shipping_type)
    #act
    login_as(user)
    visit root_path
    click_on 'Configurações'
    click_on 'Configurações de prazo'
    click_on 'Remover'
    #assert
    expect(current_path).to eq delivery_time_configurations_path
    expect(page).to have_content 'Configuração removida com sucesso!'
    expect(page).not_to have_content '10km'
    expect(page).not_to have_content '20km'
  end
end