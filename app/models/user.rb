class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, presence: true, length: { minimum: 6 },format: { with: /(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[一-龥ぁ-んァ-ン]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-んァ-ン]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :birthday, presence: true

  #has_many :items
  #has_many :orders
end
