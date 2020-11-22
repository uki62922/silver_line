class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :tel,  presence: true, uniqueness: true, format: { with: /\A\d{10}\z|\A\d{11}\z/}

  has_one_attached :image
  has_many :room_users
  has_many :rooms, through: :room_users
end
