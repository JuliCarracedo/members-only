class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, length: { in: 1..20 }, uniqueness: true
  validates :email, presence: true, format: { with: /\w+@\w+(.\w+)/ }, uniqueness: true
  validates :password, length: { in: 6..20 }, presence: true
  validate :password_requirements_are_met

  private

  def password_requirements_are_met
    rules = {
      ' must contain at least one lowercase letter' => /[a-z]+/,
      ' must contain at least one uppercase letter' => /[A-Z]+/,
      ' must contain at least one digit' => /\d+/
    }

    rules.each do |message, regex|
      errors.add(:password, message) unless password.match(regex)
    end
  end
end
