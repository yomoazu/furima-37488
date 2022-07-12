FactoryBot.define do
  factory :order_address do
    post_code            {'202-0000'}
    area_id              {'4'}
    municipality         {'test'}
    address              {'a00000'}
    building_name        {'test'}
    phone_number         {'00000000000'}
    #token                {'abc000000'}
    

    
  end
end
