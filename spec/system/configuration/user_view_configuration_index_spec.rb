require 'rails_helper'

describe 'Usuário vê a página de configurações' do
  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit root_path
    click_on 'Configurações'
    #assert
    expect(current_path).to eq configurations_path 
    expect(page).to have_link 'Configurações de preço por peso', href: weight_configurations_path
    expect(page).to have_content 'Configurações de prazo'
    expect(page).to have_content 'Configurações de preço por distância percorrida'
  end
end



