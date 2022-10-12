require 'rails_helper'

describe 'Usuário cadastra nova ordem de serviço' do
  it 'a partir da tela inicial' do
    #arrange
    #act
    visit(root_path)
    click_on 'Ordens de Serviço'
    click_on 'Adicionar nova ordem de serviço'
    #assert
    expect(page).to have_content 'Endereço de saída:'
    expect(page).to have_content 'Endereço de entrega:'
    expect(page).to have_content 'Código do produto:'
    expect(page).to have_content 'Peso do produto:'
    expect(page).to have_content 'Distância:'
  end

  it 'com sucesso' do
    #arrange
   
    #act
    visit root_path
    click_on 'Ordens de Serviço'
    click_on 'Adicionar nova ordem de serviço'
    fill_in 'Endereço de saída:', with: 'Avenida das palmeiras, 1000'
    fill_in 'Endereço de entrega:', with: 'Rua dos eucaliptos, 213'
    fill_in 'Código do produto:', with: 'NAHSG12378'
    fill_in 'Peso do produto:', with: '100000'
    fill_in 'Distância:', with: '1000'
    click_on 'Salvar'

    #assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Ordem de serviço cadastrada com sucesso!'
    expect(page).to have_content 'Avenida das palmeiras, 1000'
    expect(page).to have_content 'Rua dos eucaliptos, 213'
    expect(page).to have_content 'NAHSG12378'
    expect(page).to have_content 'Status: pending'
  end


end






