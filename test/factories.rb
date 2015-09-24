FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "yoloman#{n}@gmail.com"
    end
    password "omglolhahaha"
    password_confirmation "omglolhahaha"
  end
end


FactoryGirl.define do
  factory :place do
    name 'res'
    description 'des'
    address 'peter'
  end
end
