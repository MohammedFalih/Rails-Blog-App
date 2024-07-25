class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 20 }
  validates :body, presence: true, length: { minimum: 5, maximum: 50 }

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_noticed_notifications model_name: "Notification"
  has_many :notifications, through: :user, dependent: :destroy

  ransacker :title_or_body_or_user_name do |parent|
    Arel.sql(
      "COALESCE(#{parent.table[:title].relation.name}.title, '') || ' ' || " \
      "COALESCE(#{parent.table[:body].relation.name}.body, '') || ' ' || " \
      "COALESCE((SELECT users.name FROM users WHERE users.id = #{parent.table[:user_id].relation.name}.user_id), '')"
    )
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[title body title_or_body_or_user_name]
  end

  def self.ransackable_associations(auth_object = nil)
    ["comments", "notifications", "user"]
  end
end
