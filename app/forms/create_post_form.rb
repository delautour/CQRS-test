class CreatePostForm
  attr_accessor :author_email, :body, :title

  validates :author_email, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {minimum: 5}
  validates :title, presence: true, length: {minimum: 3, maximum: 32}
end
