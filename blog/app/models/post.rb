class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable

  validates :content, presence: true,
            length: { minimum: 120 }

  def calculation(a,b)
    yield(a,b)
  end

end
