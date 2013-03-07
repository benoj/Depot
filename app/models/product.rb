class Product < ActiveRecord::Base
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item	
 
  attr_accessible :description, :image_url, :price, :title
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: false,format:{
  	with: /\.(gif|jpg|png)/,
  	message: 'Muse be gif, png, or jpg'
    }

    private 
    def ensure_not_referenced_by_any_line_item
    	if line_items.empty?
    		return true
    	else
    		errors.add(:base, 'Line Items present')
    		return false
    	end
    end

end
