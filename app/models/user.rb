class User < ApplicationRecord

  extend FriendlyId
  friendly_id :first_name, use: :slugged

  has_many :articles
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
