class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i } 
  has_many :items
  
  with_options presence: true do

    validates :nickname
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
      validates :cc_last_name
      validates :cc_first_name 
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :kk_last_name
      validates :kk_first_name
    end
  end

end
