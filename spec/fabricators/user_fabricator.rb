Fabricator(:user) do
  id {Faker::Number.number(2) }
  email { Faker::Internet.email }
  password 'password'
  password_confirmation 'password'
end
