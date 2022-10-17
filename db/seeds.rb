user = User.create!(name: 'Ana', email: 'ana@sistemadefrete.com.br', password: 'sistema')

shipping_type_a = ShippingType.create!(name: 'Padrão', minimum_distance: 1, maximum_distance: 100, minimum_weight:1000, maximum_weight:20000, fee:500)
shipping_type_b = ShippingType.create!(name: 'Rápida', minimum_distance: 1, maximum_distance: 300, minimum_weight:1000, maximum_weight:20000, fee:1000)
shipping_type_c = ShippingType.create!(name: 'A jato', minimum_distance: 1, maximum_distance: 30, minimum_weight:1000, maximum_weight:2000, fee:1500)

delivery_time_config = DeliveryTimeConfiguration.create!(minimum_distance: 10, maximum_distance: 20, delivery_time: 123, shipping_type: shipping_type)
weight_config = WeightConfiguration.create!(minimum_weight: 100, maximum_weight: 2000, price: 1234, shipping_type: shipping_type)
price_per_distance_config = PricePerDistanceConfiguration.create!(minimum_distance: 10, maximum_distance: 20, price_per_distance: 123, shipping_type: shipping_type)

vehicle_a = Vehicle.create!(manufacturer: 'Honda', model: 'CG', year: '2020', load_capacity: 10000, license_plate: 'ASD3434')
vehicle_b = Vehicle.create!(manufacturer: 'Kia', model: 'Bongo', year: '2021', load_capacity: 181200, license_plate: 'AZS2311')
vehicle_c = Vehicle.create!(manufacturer: 'Iveco', model: 'Daily', year: '2022', load_capacity: 125000, license_plate: 'AWS8990')


work_order_a = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 100', delivery_address: 'Avenida dos Cáctos, 300', 
                                product_code: 'HJUH123450', product_weight: 100, distance: 10)
work_order_b = WorkOrder.create!(pickup_address: 'Rua das Araucárias, 2000', delivery_address: 'Avenida dos Ipês Amarelos, 20', 
                                product_code: 'MKJN123423', product_weight: 10000, distance: 500)
work_order_c = WorkOrder.create!(pickup_address: 'Rua das Cerejeiraseiras, 30', delivery_address: 'Avenida das Hortências, 4000', 
                                product_code: 'KOIN123467', product_weight: 100000, distance: 100)