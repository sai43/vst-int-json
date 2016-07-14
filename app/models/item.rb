class Item < ActiveRecord::Base
    validates :title, :description, :price, :status, :published_date, presence: true
    
    validates :status, inclusion: { in: %w(available pending sold expired banned),
                     message: "%{value} is not a valid status" }
    
end
