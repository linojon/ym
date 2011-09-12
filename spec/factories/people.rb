# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
      last_name "MyString"
      first_name "MyString"
      middle_name "MyString"
      maiden "MyString"
      #prefix "MyString"
      #postfix "MyString"
      gender 'male' #{ Person::GENDERS[rand 2] }
      birthdate "2011-09-11"
      deathdate "2011-09-11"
    end
end