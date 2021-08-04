FactoryBot.define do
  factory :order_shipping do
    postal_code { '111-1111' }
    region_id {2}
    municipalities { '横浜市緑区'}
    address { '青山1-1-1' }
    building { '柳ビル' }
    telephone_number { '11111111111' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
