class Item < ActiveRecord::Base
    belongs_to :seller
    belongs_to :category
    
    validates :title, :description, :price, :status, :published_date, presence: true
    
    validates :status, inclusion: { in: %w(available pending sold expired banned),
                     message: "%{value} is not a valid status" }

    scope :find_items, -> (status, seller_id) { where(status: status).where(seller_id: seller_id) }
    scope :category_items, -> (category_id) {where(category_id: category_id)}
end
