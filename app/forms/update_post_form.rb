class UpdatePostForm < Form

  attr_accessor :body, :title, :id

  validates :body, presence: true, length: {minimum: 5}
  validates :title, presence: true, length: {minimum: 3, maximum: 32}
end
