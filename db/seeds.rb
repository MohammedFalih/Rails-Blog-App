User.create!(
    email: "thisisfalih@gmail.com",
    password: "mohammed",
    password_confirmation: "mohammed",
    name: "Falih",
    role: User.roles[:admin]
)
User.create!(
    email: "mike@gmail.com",
    password: "password",
    password_confirmation: "password",
    name: "Tyson",
)

puts "Users created: #{User.count}"

10.times do |x|
    post = Post.create(
        title: "Title #{x}",
        body: "Body #{x} words go here..",
        user_id: User.first.id
    )
    if post.persisted?
        puts "Created Post: #{post.title}"
    else
        puts "Failed to create Post #{x}: #{post.errors.full_messages.join(", ")}"
    end

    5.times do |y|
        comment = Comment.create(
            body: "Comment #{y}",
            user_id: User.second.id,
            post_id: post.id
        )
        if comment.persisted?
            puts "Created Comment: #{comment.body}"
        else
            puts "Failed to create Comment #{y} on Post #{x}: #{comment.errors.full_messages.join(", ")}"
        end
    end
end

puts "Posts created: #{Post.count}"
puts "Comments created: #{Comment.count}"
