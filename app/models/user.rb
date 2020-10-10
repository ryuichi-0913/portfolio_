class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      has_many :foods,dependent: :destroy
      has_many :nonfoods,dependent: :destroy
      attachment :user_image

      enum profession:[:profession_private, :unemployed, :worker, :housework]
      enum gender:[:gender_private, :man, :human]
      enum age_group:[:age_private, :Twenties, :thirties, :forties, :fifties, :sixties, :seventies, :eighties, :nineties]

end
