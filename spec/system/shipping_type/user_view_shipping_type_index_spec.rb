require 'rails_helper'

describe 'Usuário vê a página de modalidades de transporte' do
  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit root_path
    click_on 'Modalidades de Transporte'
    #assert
    expect(current_path).to eq shipping_types_path 
  end
end
