FactoryBot.define do
  factory :user do # Фабрика для генерации в тесте модели Юзер
    email { Faker::Internet.email }  # Задаем случайный имейл для Юзера
    password { Faker::Internet.password(min_length: 4) } # Задаем случайный пароль для юзера
    password_confirmation { password } # Задаем подтверждение пароля для Юзера импользуя сгенерированый пароль
  end
end