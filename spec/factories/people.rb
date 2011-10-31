# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
      last_name     { Faker::Name.last_name }
      first_name    { Faker::Name.first_name }
      middle_name   { Faker::Name.first_name }
      #prefix "MyString"
      #postfix "MyString"
      gender        { Person::GENDERS[rand 2] }
      ignore do
        bdate   { randomDate(:year_range => 60, :year_latest => 22).to_date }
      end
      maiden        { Faker::Name.last_name if gender=='female' }
      birth_date    { bdate }
      death_date    { bdate + rand(Date.today - bdate) }
    end
end