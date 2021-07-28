class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :cc_last_name, presence: true
  validates :cc_first_name, presence: true
  validates :kk_last_name, presence: true
  validates :kk_first_name, presence: true
  validates :birthday, presence: true

  
end
