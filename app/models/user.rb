class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events
  enum gender: { "女": 0, "男": 1 }
  enum user_level: { normal: 0, admin: 1 }
  has_one_attached :avatar
end
