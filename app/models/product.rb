class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: false,format:{
  	with: /\.(gif|jpg|png)/,
  	message: 'Muse be gif, png, or jpg'
    }
end
