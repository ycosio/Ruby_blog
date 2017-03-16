require 'support/factory_girl.rb'

FactoryGirl.define do

  factory :user, class: User do
    email "user@gmail.com"
    password "111111"
    password_confirmation "111111"
  end

  factory :wrong_user, class: User do
    email "guy@gmail.com"
    password "111111"
    password_confirmation "111111"
  end

end
