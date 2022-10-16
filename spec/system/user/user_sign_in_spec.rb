require 'rails_helper'

describe 'Usuário se autentica' do
  it 'com sucesso' do
    #arrange
    #act
    visit work_orders_path
    click_on 'Sign up'
    fill_in 'Nome', with: 'Ana'
    fill_in 'E-mail', with: 'ana@sistemadefrete.com.br'
    fill_in 'Senha', with: 'sistema'
    fill_in 'Confirme sua senha', with: 'sistema'
    click_button 'Sign up'
    
    #assert
    expect(page).to have_content 'Registro realizado com sucesso.'
    within('nav') do
      expect(page).not_to have_link 'Log in'
      expect(page).to have_button 'Log out'
      expect(page).to have_content 'ana@sistemadefrete.com.br'
    end
  end

  it 'e faz logout' do
    #arrange
    user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')
   
    #act
    login_as(user)
    visit work_orders_path
    click_on 'Log out'

    #assert
    expect(page).to have_content 'Logout efetuado com sucesso.'
    within('nav') do
      expect(page).to have_link 'Log in'
      expect(page).not_to have_button 'Log out'
      expect(page).not_to have_content 'ana@sistemadefrete.com.br' 
    end
  end
end