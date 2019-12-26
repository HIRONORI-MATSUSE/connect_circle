FactoryBot.define do
  factory :user do
    email {"test1@gmail.com"}
    password {"password"} 
  end

  factory :second_user, class: User do
    email {"test2@gmail.com"}
    password {"password"}
  end

  factory :third_user, class: User do
    email {"test3@gmail.com"}
    password {"password"}
  end

  factory :forth_user, class: User do
    email {"test4@gmail.com"}
    password {"password"}
  end
end