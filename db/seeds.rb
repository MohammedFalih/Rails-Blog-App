User.create!(
  email: "thisisfalih@gmail.com",
  password: "mohammed",
  password_confirmation: "mohammed",
  name: "Falih",
  role: User.roles[:admin],
)
User.create!(
  email: "mike@gmail.com",
  password: "password",
  password_confirmation: "password",
  name: "Tyson",
)

elapsed = Benchmark.measure do
  posts = []
  falih = User.first
  tyson = User.second
  1000.times do |x|
    puts "creating post #{x}"
    post = Post.new(
      title: "Title #{x}",
      body: "Body #{x} words go here..",
      user: falih
    )

    10.times do |y|
      puts "creating comment #{y} for post #{x}"
      post.comments.build(
        body: "Comment #{y}",
        user: tyson
      )
    end
    posts.push(post)
  end
  Post.import(posts, recursive: true)
end

puts "Elapsed time is #{elapsed.real} seconds"
