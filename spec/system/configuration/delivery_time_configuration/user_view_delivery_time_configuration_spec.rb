require 'rails_helper'

describe 'Usuário vê a página de configurações' do
  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit root_path
    click_on 'Configurações'
    click_on 'Configurações de prazo'
    #assert
    expect(current_path).to eq delivery_time_configurations_path 
    expect(page).to have_link 'Adicionar nova configuração', href: new_delivery_time_configuration_path
  end

  it 'e verifica que não há configurações cadastradas no momento' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit root_path
    click_on 'Configurações'
    click_on 'Configurações de prazo'
    #assert
    expect(page).to have_content 'Não existem configurações cadastradas.'
  end
end