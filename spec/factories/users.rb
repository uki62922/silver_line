FactoryBot.define do
  factory :user do
    name  {Faker::Name.last_name}
    tel { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}

    after(:build) do |user|
      user.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end