class Tweet < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  paginates_per 5
end
