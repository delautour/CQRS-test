class PostReport < ActiveRecord::Base
  self.table_name = :posts

  belongs_to :author, class_name: User

  default_scope includes(:author)
  default_scope order("created_at DESC")

  def author_name
    author.email
  end
end
