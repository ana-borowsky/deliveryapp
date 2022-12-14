require 'rails_helper'

describe 'Usuário cadastra uma modalidade de transporte' do
  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
    #act
    login_as user
    visit work_orders_path
    click_on 'Modalidades de Transporte'
    click_on 'Adicionar nova modalidade de transporte'

    #assert
    expect(page).to have_content 'Nome:' 
    expect(page).to have_content 'Distância mínima:'
    expect(page).to have_content 'Distância máxima:'
    expect(page).to have_content 'Peso mínimo:'
    expect(page).to have_content 'Peso máximo:'
    expect(page).to have_content 'Taxa:'  
  end

  it 'com sucesso' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
    #act
    login_as user
    visit work_orders_path
    click_on 'Modalidades de Transporte'
    click_on 'Adicionar nova modalidade de transporte'
    fill_in 'Nome', with: 'Motoboy'
    fill_in 'Distância mínima', with: '1'
    fill_in 'Distância máxima', with: '30'
    fill_in 'Peso mínimo', with: '1000'
    fill_in 'Peso máximo', with: '20000'
    fill_in 'Taxa', with: '5'
    click_on 'Salvar'

    #assert
    expect(current_path).to eq shipping_types_path
    expect(page).to have_content 'Motoboy' 
    expect(page).to have_content 'Distância mínima: 1km'
    expect(page).to have_content 'Distância máxima: 30km'
    expect(page).to have_content 'Peso mínimo: 10kg'
    expect(page).to have_content 'Peso máximo: 200kg'
    expect(page).to have_content 'Taxa: R$ 5,00'   
  end
end

