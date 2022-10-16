require 'rails_helper'

describe 'Usuario visita tela inicial' do
  it 'e vê o nome da app' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit work_orders_path
    #assert
    expect(page).to have_content 'Sistema de Fretes'
  end

  it 'e vê o subtítulo' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit work_orders_path
    #assert
    expect(page).to have_content 'Ordens de Serviço'
  end

  it 'e encontra o link para as Ordens de Serviço' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit work_orders_path
    click_on 'Ordens de Serviço'
    #assert
    expect(current_path).to eq work_orders_path
  end

  it 'e verifica que não há ordens de serviço cadastradas no momento' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
    #act
    login_as(user)
    visit work_orders_path
    #assert
    expect(page).to have_content 'Não existem ordens de serviço cadastradas.'
  end
end