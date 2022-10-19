require 'rails_helper'

RSpec.describe WorkOrder, type: :model do

  describe 'gera um código aleatório' do
    it 'ao criar uma nova ordem de serviço' do
      #arrange
      user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)

      work_order = WorkOrder.new(pickup_address: 'Rua das Laranjeiras, 100', delivery_address: 'Avenida dos Cáctos, 300', 
                                product_code: 'HJUH123450', product_weight: 100, distance: 10)
      #act
      work_order.save!
      result = work_order.code
      #assert
      expect(result).not_to be_empty
      expect(result.length).to eq 15
    end

    it 'e o código é único' do
      #arrange
      user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
      work_order_a = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 100', delivery_address: 'Avenida dos Cáctos, 300', 
                                      product_code: 'HJUH123450', product_weight: 100, distance: 10)
      work_order_b = WorkOrder.new(pickup_address: 'Rua das Araucárias, 2000', delivery_address: 'Avenida dos Ipês Amarelos, 20', 
                                      product_code: 'MKJN123423', product_weight: 10000, distance: 500)
      #act
      work_order_b.save!
      
      #assert
      expect(work_order_b.code).not_to eq work_order_a.code
    end

    it 'e o código não deve ser modificado' do
      #arrange
      user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema', admin: true)
      work_order = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 100', delivery_address: 'Avenida dos Cáctos, 300', 
                                      product_code: 'HJUH123450', product_weight: 100, distance: 10)
      original_code = work_order.code
      #act
      work_order.update!(product_code: 'HJUH123222')
      #assert
      expect(work_order.code).to eq original_code
    end
  end
end