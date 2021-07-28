FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'abc123'}
    password_confirmation {password}
    cc_last_name          {'山口'}
    cc_first_name         {'太郎'}
    kk_last_name          {'ヤマグチ'}
    kk_first_name         {'タロウ'}
    birthday              {'2000-01-01'}
  end
end