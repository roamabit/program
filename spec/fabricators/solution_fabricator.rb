Fabricator(:solution) do
  problem_id { Faker::Number.number(1) }
  project_id { Faker::Number.number(1) }
  solution_abstract { Faker::Lorem.words(10) }
  user_id { Faker::Number.number(1) }
end
