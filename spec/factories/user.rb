FactoryBot.define do
  factory :user do
    name              {'test'}
    email                 {'test@example'}
    password     {'a00000'}
    password_confirmation  {password}
    first_name             {'テスト'}
    first_name_furigana    {'テスト'}
    last_name              {'テスト'}
    last_name_furigana     {'テスト'}
    date_of_bath           {'2022-01-01'}
      



  end
end