puts "Seeding development database..."

falih = User.first_or_create!(
  email: "thisisfalih@gmail.com",
  password: "mohammed",
  password_confirmation: "mohammed",
  first_name: "Mohammed",
  last_name: "Falih",
  role: User.roles[:admin],
)
tyson = User.first_or_create!(
  email: "mike@gmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Mike",
  last_name: "Tyson",
)

Address.first_or_create!(
  street: "123 Park Avenue 1st street",
  city: "NYC",
  state: "New York",
  zip: "12345",
  country: "USA",
  user: falih
)
Address.first_or_create(
  street: "1 St.George street",
  city: "Paris",
  state: "Paris",
  zip: "78462",
  country: "France",
  user: tyson
)

elapsed = Benchmark.measure do
  posts = []
  10.times do |x|
    puts "creating post #{x}"
    post = Post.new(
      title: "Title #{x}",
      body: "Body #{x} words go here..",
      user: falih,
    )

    4.times do |y|
      puts "creating comment #{y} for post #{x}"
      post.comments.build(
        body: "Comment #{y}",
        user: tyson,
      )
    end
    posts.push(post)
  end
  Post.import(posts, recursive: true)
end


puts "Seeded development DB in #{elapsed.real} seconds"
