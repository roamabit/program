Fabricator(:solution) do
  solution {Faker::Lorem.words(20) }
  problem_id { Faker::Number.number(1) }
  project_id { Faker::Number.number(1) }
  solution_abstract { Faker::Lorem.words(10) }
  user_id { Faker::Number.number(1) }
  published_at { Faker::DateTime.now }
end
