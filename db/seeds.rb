User.create!([
  {password_salt: nil, email: "rotakhin@gmail.com", encrypted_password: "$2a$10$lmyL7EtsbZHY550ig59dGu4.u16.eQR2wZbnNJebBmmy8n2gNDbty", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 5, current_sign_in_at: "2015-08-03 13:54:28", last_sign_in_at: "2015-08-03 13:39:07", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil}
])
Comment.create!([
  {commentable_id: 1, commentable_type: "Problem", title: "Big one", body: "This is a big issue", subject: "Issue", user_id: 1, parent_id: nil, lft: 1, rgt: 2}
])
Partnership.create!([
  {user_id: 1, project_id: 1, role: "Author"},
  {user_id: 1, project_id: 2, role: "Author"}
])
Problem.create!([
  {statement: "BOM Data is publishing ncorrectly to accounting systems", body: "Trucks built in 2011 showing up in 2014 reports. ", published_at: "2015-07-23 14:44:00", location: "Kenworth Renton Factory", user_id: 1, latitude: 47.4945, longitude: -122.195},
  {statement: "Gross Receipts Report", body: "Incorrect Part quantities listed on receipt reports", published_at: "2015-07-24 03:10:00", location: "PACCAR Bellevue WA", user_id: 1, latitude: 47.617, longitude: -122.2},
  {statement: "BOM Data is publishing ncorrectly to accounting systems", body: "Trucks built in 2011 showing up in 2014 reports. ", published_at: nil, location: "Bellevue, WA", user_id: 1, latitude: 47.3073, longitude: -122.228},
  {statement: "Need to buy a couch", body: "L Shape  Shez", published_at: "2015-07-24 03:37:00", location: "Lea Hill Auburn WA", user_id: 1, latitude: 47.3262, longitude: -122.182},
  {statement: "USER ID", body: "User Id Not populating to the Database Layer Need to add the USER ID to the model on problem Create method.", published_at: "2015-07-24 03:55:00", location: "Auburn WA", user_id: 1, latitude: 47.3073, longitude: -122.228}
])
Project.create!([
  {title: "Fix The scripts", body: "Create a script that check bom data to accouting data", published_at: "2015-07-24 03:12:00", user_id: 1},
  {title: "Collect Local Fruit", body: "Gather people to collect ripe fruit around the neighborhood and sell it. ", published_at: "2015-08-01 04:57:00", user_id: 1}
])
Solution.create!([
  {problem_id: 3, project_id: 1, solution_abstract: "It will validate accounting data", published_at: "2015-07-23 00:00:00"}
])
