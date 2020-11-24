class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :foods, dependent: :destroy
  has_many :nonfoods, dependent: :destroy
  has_many :food_comments, dependent: :destroy
  has_many :nonfood_comments, dependent: :destroy
  has_many :food_favorites, dependent: :destroy
  has_many :nonfood_favorites, dependent: :destroy
  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy # フォロー取得 # rubocop:disable Rails/InverseOf
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy # フォロワー取得 # rubocop:disable Rails/InverseOf
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
  has_many :contact, dependent: :destroy
  attachment :user_image

  enum profession: { profession_private: 0, unemployed: 1, worker: 2, housework: 3 }
  enum gender: { gender_private: 0, man: 1, human: 2 }
  enum age_group: { age_private: 0, Twenties: 1, thirties: 2, forties: 3, fifties: 4, sixties: 5, seventies: 6, eighties: 7, nineties: 8 } # rubocop:disable Layout/LineLength
  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end
end
