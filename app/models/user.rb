class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :answers
  has_many :questions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
