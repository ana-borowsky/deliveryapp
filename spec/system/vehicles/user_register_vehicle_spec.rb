require 'rails_helper'

describe 'Usuário cadastra novo veículo' do
  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit work_orders_path
    click_on 'Veículos'
    click_on 'Adicionar novo veículo'
    #assert
    expect(page).to have_content 'Placa:'
    expect(page).to have_content 'Fabricante:'
    expect(page).to have_content 'Modelo:'
    expect(page).to have_content 'Capacidade de carga:'
    expect(page).to have_content 'Ano de fabricação:'
  end

  it 'com sucesso' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as user
    visit work_orders_path
    click_on 'Veículos'
    click_on 'Adicionar novo veículo'
    fill_in 'Placa:', with: 'ASD3434'
    fill_in 'Fabricante', with: 'Honda'
    fill_in 'Modelo:', with: 'CG'
    fill_in 'Ano de fabricação', with: '2020'
    fill_in 'Capacidade de carga', with: '10000'
    click_on 'Salvar'

    #assert
    expect(current_path).to eq vehicles_path
    expect(page).to have_content 'Honda CG ASD3434' 
    expect(page).to have_content 'Em manutenção:'
    expect(page).to have_content 'Disponível:'
  end
end