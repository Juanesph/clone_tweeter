class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :retweets
  validates :content, presence: true
  paginates_per 50

  scope :tweets_for_me, -> (user_ids) {where(user_id: user_ids)}

  def users_images
    user_ids = likes.pluck(:user_id)
    user_images = User.where(id: user_ids).pluck(:image_url)
    user_images
  end

   
  
end
