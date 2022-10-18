user = User.create!(name: 'João', email: 'joao@sistemadefrete.com.br', password: 'sistema')

shipping_type_a = ShippingType.create!(name: 'Padrão', minimum_distance: 1, maximum_distance: 1000, minimum_weight:100, maximum_weight:10_000, fee:500)
shipping_type_b = ShippingType.create!(name: 'Rápida', minimum_distance: 1, maximum_distance: 1000, minimum_weight:1000, maximum_weight:10_000, fee:1000)
shipping_type_c = ShippingType.create!(name: 'A jato', minimum_distance: 1, maximum_distance: 1000, minimum_weight:1000, maximum_weight:10_000, fee:1500)

delivery_time_config_a = DeliveryTimeConfiguration.create!(minimum_distance: 1, maximum_distance: 30, delivery_time: 24, shipping_type: shipping_type_a)
delivery_time_config_b = DeliveryTimeConfiguration.create!(minimum_distance: 31, maximum_distance: 100, delivery_time: 36, shipping_type: shipping_type_a)
delivery_time_config_c = DeliveryTimeConfiguration.create!(minimum_distance: 101, maximum_distance: 300, delivery_time: 48, shipping_type: shipping_type_a)
delivery_time_config_d = DeliveryTimeConfiguration.create!(minimum_distance: 301, maximum_distance: 600, delivery_time: 72, shipping_type: shipping_type_a)
delivery_time_config_e = DeliveryTimeConfiguration.create!(minimum_distance: 601, maximum_distance: 1000, delivery_time: 120, shipping_type: shipping_type_a)

delivery_time_config_f = DeliveryTimeConfiguration.create!(minimum_distance: 1, maximum_distance: 30, delivery_time: 8, shipping_type: shipping_type_b)
delivery_time_config_g = DeliveryTimeConfiguration.create!(minimum_distance: 31, maximum_distance: 100, delivery_time: 24, shipping_type: shipping_type_b)
delivery_time_config_h = DeliveryTimeConfiguration.create!(minimum_distance: 101, maximum_distance: 300, delivery_time: 36, shipping_type: shipping_type_b)
delivery_time_config_i = DeliveryTimeConfiguration.create!(minimum_distance: 301, maximum_distance: 600, delivery_time: 48, shipping_type: shipping_type_b)
delivery_time_config_j = DeliveryTimeConfiguration.create!(minimum_distance: 601, maximum_distance: 1000, delivery_time: 72, shipping_type: shipping_type_b)

delivery_time_config_k = DeliveryTimeConfiguration.create!(minimum_distance: 1, maximum_distance: 30, delivery_time: 2, shipping_type: shipping_type_c)
delivery_time_config_l = DeliveryTimeConfiguration.create!(minimum_distance: 31, maximum_distance: 100, delivery_time: 12, shipping_type: shipping_type_c)
delivery_time_config_m = DeliveryTimeConfiguration.create!(minimum_distance: 101, maximum_distance: 300, delivery_time: 24, shipping_type: shipping_type_c)
delivery_time_config_n = DeliveryTimeConfiguration.create!(minimum_distance: 301, maximum_distance: 600, delivery_time: 36, shipping_type: shipping_type_c)
delivery_time_config_o = DeliveryTimeConfiguration.create!(minimum_distance: 601, maximum_distance: 1000, delivery_time: 48, shipping_type: shipping_type_c)

weight_config_a = WeightConfiguration.create!(minimum_weight: 1, maximum_weight: 1000, price: 100, shipping_type: shipping_type_a)
weight_config_b = WeightConfiguration.create!(minimum_weight: 1001, maximum_weight: 2000, price: 150, shipping_type: shipping_type_a)
weight_config_c = WeightConfiguration.create!(minimum_weight: 2001, maximum_weight: 5000, price: 200, shipping_type: shipping_type_a)
weight_config_d = WeightConfiguration.create!(minimum_weight: 5001, maximum_weight: 10_000, price: 250, shipping_type: shipping_type_a)
weight_config_e = WeightConfiguration.create!(minimum_weight: 5001, maximum_weight: 10_000, price: 300, shipping_type: shipping_type_a)
weight_config_f = WeightConfiguration.create!(minimum_weight: 10_001, maximum_weight: 50_000, price: 350, shipping_type: shipping_type_a)
weight_config_g = WeightConfiguration.create!(minimum_weight: 50_001, maximum_weight: 100_000, price: 400, shipping_type: shipping_type_a)

weight_config_h = WeightConfiguration.create!(minimum_weight: 1, maximum_weight: 1000, price: 200, shipping_type: shipping_type_b)
weight_config_i = WeightConfiguration.create!(minimum_weight: 1001, maximum_weight: 2000, price: 250, shipping_type: shipping_type_b)
weight_config_j = WeightConfiguration.create!(minimum_weight: 2001, maximum_weight: 5000, price: 300, shipping_type: shipping_type_b)
weight_config_k = WeightConfiguration.create!(minimum_weight: 5001, maximum_weight: 10_000, price: 350, shipping_type: shipping_type_b)
weight_config_l = WeightConfiguration.create!(minimum_weight: 5001, maximum_weight: 10_000, price: 400, shipping_type: shipping_type_b)
weight_config_m = WeightConfiguration.create!(minimum_weight: 10_001, maximum_weight: 50_000, price: 450, shipping_type: shipping_type_b)
weight_config_n = WeightConfiguration.create!(minimum_weight: 50_001, maximum_weight: 100_000, price: 500, shipping_type: shipping_type_b)

weight_config_o = WeightConfiguration.create!(minimum_weight: 1, maximum_weight: 1000, price: 300, shipping_type: shipping_type_c)
weight_config_p = WeightConfiguration.create!(minimum_weight: 1001, maximum_weight: 2000, price: 350, shipping_type: shipping_type_c)
weight_config_q = WeightConfiguration.create!(minimum_weight: 2001, maximum_weight: 5000, price: 400, shipping_type: shipping_type_c)
weight_config_r = WeightConfiguration.create!(minimum_weight: 5001, maximum_weight: 10_000, price: 450, shipping_type: shipping_type_c)
weight_config_s = WeightConfiguration.create!(minimum_weight: 5001, maximum_weight: 10_000, price: 500, shipping_type: shipping_type_c)
weight_config_t = WeightConfiguration.create!(minimum_weight: 10_001, maximum_weight: 50_000, price: 550, shipping_type: shipping_type_c)
weight_config_u = WeightConfiguration.create!(minimum_weight: 50_001, maximum_weight: 100_000, price: 600, shipping_type: shipping_type_c

price_per_distance_config_a = PricePerDistanceConfiguration.create!(minimum_distance: 1, maximum_distance: 30, price_per_distance: 100, shipping_type: shipping_type_a)
price_per_distance_config_b = PricePerDistanceConfiguration.create!(minimum_distance: 31, maximum_distance: 100, price_per_distance: 150, shipping_type: shipping_type_a)
price_per_distance_config_c = PricePerDistanceConfiguration.create!(minimum_distance: 101, maximum_distance: 300, price_per_distance: 200, shipping_type: shipping_type_a)
price_per_distance_config_d = PricePerDistanceConfiguration.create!(minimum_distance: 301, maximum_distance: 600, price_per_distance: 250, shipping_type: shipping_type_a)
price_per_distance_config_e = PricePerDistanceConfiguration.create!(minimum_distance: 601, maximum_distance: 1000, price_per_distance: 300, shipping_type: shipping_type_a)

price_per_distance_config_f = PricePerDistanceConfiguration.create!(minimum_distance: 1, maximum_distance: 30, price_per_distance: 200, shipping_type: shipping_type_b)
price_per_distance_config_g = PricePerDistanceConfiguration.create!(minimum_distance: 31, maximum_distance: 100, price_per_distance: 250, shipping_type: shipping_type_b)
price_per_distance_config_h = PricePerDistanceConfiguration.create!(minimum_distance: 101, maximum_distance: 300, price_per_distance: 300, shipping_type: shipping_type_b)
price_per_distance_config_i = PricePerDistanceConfiguration.create!(minimum_distance: 301, maximum_distance: 600, price_per_distance: 350, shipping_type: shipping_type_b)
price_per_distance_config_j = PricePerDistanceConfiguration.create!(minimum_distance: 601, maximum_distance: 1000, price_per_distance: 400, shipping_type: shipping_type_b)

price_per_distance_config_k = PricePerDistanceConfiguration.create!(minimum_distance: 1, maximum_distance: 30, price_per_distance: 300, shipping_type: shipping_type_c)
price_per_distance_config_l = PricePerDistanceConfiguration.create!(minimum_distance: 31, maximum_distance: 100, price_per_distance: 350, shipping_type: shipping_type_c)
price_per_distance_config_m = PricePerDistanceConfiguration.create!(minimum_distance: 101, maximum_distance: 300, price_per_distance: 400, shipping_type: shipping_type_c)
price_per_distance_config_n = PricePerDistanceConfiguration.create!(minimum_distance: 301, maximum_distance: 600, price_per_distance: 450, shipping_type: shipping_type_c)
price_per_distance_config_o = PricePerDistanceConfiguration.create!(minimum_distance: 601, maximum_distance: 1000, price_per_distance: 500, shipping_type: shipping_type_c)

vehicle_b = Vehicle.create!(manufacturer: 'Kia', model: 'Bongo', year: '2021', load_capacity: 181200, license_plate: 'AZS2311')
vehicle_b = Vehicle.create!(manufacturer: 'Kia', model: 'Bongo', year: '2021', load_capacity: 181200, license_plate: 'AZZ2312')
vehicle_b = Vehicle.create!(manufacturer: 'Kia', model: 'Bongo', year: '2021', load_capacity: 181200, license_plate: 'AZQ2323')
vehicle_b = Vehicle.create!(manufacturer: 'Kia', model: 'Bongo', year: '2021', load_capacity: 181200, license_plate: 'AXD4444')
vehicle_b = Vehicle.create!(manufacturer: 'Kia', model: 'Bongo', year: '2021', load_capacity: 181200, license_plate: 'AAQ9876')
vehicle_c = Vehicle.create!(manufacturer: 'Iveco', model: 'Daily', year: '2022', load_capacity: 125000, license_plate: 'AWS8990')
vehicle_c = Vehicle.create!(manufacturer: 'Iveco', model: 'Daily', year: '2022', load_capacity: 125000, license_plate: 'AAQ8987')
vehicle_c = Vehicle.create!(manufacturer: 'Iveco', model: 'Daily', year: '2022', load_capacity: 125000, license_plate: 'AZA7654')
vehicle_c = Vehicle.create!(manufacturer: 'Iveco', model: 'Daily', year: '2022', load_capacity: 125000, license_plate: 'AMN6543')
vehicle_c = Vehicle.create!(manufacturer: 'Iveco', model: 'Daily', year: '2022', load_capacity: 125000, license_plate: 'ASD7463')

work_order_a = WorkOrder.create!(pickup_address: 'Rua das Laranjeiras, 100', delivery_address: 'Avenida dos Cáctos, 300', 
                                product_code: 'HJUH123450', product_weight: 100, distance: 10)
work_order_b = WorkOrder.create!(pickup_address: 'Rua das Araucárias, 2000', delivery_address: 'Avenida dos Ipês Amarelos, 20', 
                                product_code: 'MKJN123423', product_weight: 10000, distance: 500)
work_order_c = WorkOrder.create!(pickup_address: 'Rua das Cerejeireiras, 30', delivery_address: 'Avenida das Hortências, 4000', 
                                product_code: 'KOIN123467', product_weight: 100000, distance: 100)
work_order_d = WorkOrder.create!(pickup_address: 'Rua das Margaridas, 13', delivery_address: 'Avenida das Orquídeas, 67', 
                                product_code: 'KOIN123467', product_weight: 100000, distance: 1000)
work_order_e = WorkOrder.create!(pickup_address: 'Rua das Amoreiras, 16', delivery_address: 'Avenida das Hortelãs, 85', 
                                  product_code: 'KOIN123467', product_weight: 100000, distance: 700)