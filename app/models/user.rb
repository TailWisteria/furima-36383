class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :cc_last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :cc_first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :kk_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :kk_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true


end
