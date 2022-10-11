require 'rails_helper'

describe 'Usuario visita tela inicial' do
  it 'e vê o nome da app' do
    #arrange
    #act
    visit(root_path)
    #assert
    expect(page).to have_content 'Sistema de Fretes'
  end

  it 'e vê o subtítulo' do
    #arrange
    #act
    visit(root_path)
    #assert
    expect(page).to have_content 'Ordens de Serviço'
  end

  it 'e encontra o link para as Ordens de Serviço' do
    #arrange
    #act
    visit(root_path)
    click_on 'Ordens de Serviço'
    #assert
    expect(current_path).to eq root_path
  end

  it 'e verifica que não há ordens de serviço cadastradas no momento' do
    #arrange
    #act
    visit(root_path)
    #assert
    expect(page).to have_content 'Não existem ordens de serviço cadastradas.'
  end
end