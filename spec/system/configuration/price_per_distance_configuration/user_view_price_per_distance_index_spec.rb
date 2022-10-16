require 'rails_helper'

describe 'Usuário vê a página de configurações de preço por distância' do
  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit work_orders_path
    click_on 'Configurações'
    click_on 'Configurações de preço por distância percorrida'
    #assert
    expect(current_path).to eq price_per_distance_configurations_path 
    expect(page).to have_link 'Adicionar nova configuração', href: new_price_per_distance_configuration_path
  end

  it 'e verifica que não há configurações de preço por distância cadastradas no momento' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit work_orders_path
    click_on 'Configurações'
    click_on 'Configurações de preço por distância percorrida'
    #assert
    expect(page).to have_content 'Não existem configurações cadastradas.'
  end
end