FactoryBot.define do
  factory :user do
    name              {'test'}
    email                 {'test@example'}
    password     {'a00000'}
    password_confirmation  {password}
    first_name             {'test'}
    first_name_furigana    {'test'}
    last_name              {'test'}
    last_name_furigana     {'test'}
    date_of_bath           {'2022-01-01'}
      



  end
end