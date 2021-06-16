class Post < ApplicationRecord
  belongs_to :user

  validates :title, uniqueness: true, presence: true, length:{in: 1...100}
  validates :body, presence: true, length: {minimum: 20}
end
