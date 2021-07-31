FactoryBot.define do
  factory :item do
    name               {'text'}
    detail             {'text'}
    category_id        {2}
    condition_id       {2}
    shipping_charge_id {2}
    required_day_id    {2}
    region_id          {2}
    price              {3000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
