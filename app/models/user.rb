class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :event_logs
  has_many :events, through: :event_logs
  enum gender: { "男": 0, "女": 1 }
  enum user_level: { normal: 0, admin: 1 }
  has_one_attached :avatar
end
