require 'rails_helper'

describe 'Usuário cadastra uma nova configuração de preço por peso' do
  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as user
    visit root_path
    click_on 'Configurações'
    click_on 'Configurações de preço por peso'
    click_on 'Adicionar nova configuração'

    #assert
    expect(page).to have_content 'Peso mínimo:'
    expect(page).to have_content 'Peso máximo:'
    expect(page).to have_content 'Preço:'  
  end

#   it 'com sucesso' do
#     #arrange
#     user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
#     #act
#     login_as user
#     visit root_path
#     click_on 'Modalidades de Transporte'
#     click_on 'Adicionar nova modalidade de transporte'
#     fill_in 'Nome', with: 'Motoboy'
#     fill_in 'Distância mínima', with: '1'
#     fill_in 'Distância máxima', with: '30'
#     fill_in 'Peso mínimo', with: '1000'
#     fill_in 'Peso máximo', with: '20000'
#     fill_in 'Taxa', with: '500'
#     click_on 'Salvar'

#     #assert
#     expect(current_path).to eq shipping_types_path
#     expect(page).to have_content 'Motoboy' 
#     expect(page).to have_content 'Distância mínima: 1km'
#     expect(page).to have_content 'Distância máxima: 30km'
#     expect(page).to have_content 'Peso mínimo: 1000'
#     expect(page).to have_content 'Peso máximo: 20000'
#     expect(page).to have_content 'Taxa: 500'   
#   end
end

