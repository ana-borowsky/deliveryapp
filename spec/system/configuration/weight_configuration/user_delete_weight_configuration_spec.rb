require 'rails_helper'
describe 'Usuário remove uma configuração de peso' do
  it 'com sucesso' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    config = WeightConfiguration.create!(minimum_weight: 100, maximum_weight: 2000, price: 1234)
    #act
    login_as(user)
    visit root_path
    click_on 'Configurações'
    click_on 'Configurações de preço por peso'
    click_on 'Remover'
    #assert
    expect(current_path).to eq weight_configurations_path
    expect(page).to have_content 'Configuração removida com sucesso!'
    expect(page).not_to have_content '1kg'
    expect(page).not_to have_content '20kg'
  end
end