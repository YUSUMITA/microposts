class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: {maximum: 255}
  
    
  has_many :favorites, dependent: :destroy
  has_many :favoritedusers, through: :favorites, source: :user
end
