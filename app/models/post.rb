class Post < ApplicationRecord
  belongs_to :user

  validates :title, uniqueness: true, length: { in: 1...100 }
  validates :body, length: { minimum: 20 }
end
