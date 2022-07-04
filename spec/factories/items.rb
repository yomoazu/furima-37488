FactoryBot.define do

  factory :item do
    product_name              {'444'}
    description_of_item       {'444'}
    category_id               {'10'}
    product_condition_id      {'3'}
    delivery_charge_id        {'2'}
    area_id                   {'4'}
    shipping_day_id           {'3'}
    price                    {'444'}
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/sample1.png'), filename: 'test_image.png')
      
    end
    association :user



  end
end