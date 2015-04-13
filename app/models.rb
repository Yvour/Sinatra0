# app/models.rb
class Table < ActiveRecord::Base

  validates :number, presence: true, length: {maximum: 2}
  validates :description, presence: true
  
  has_many :table_orders
end

class Meal < ActiveRecord::Base

  validates :name, presence: true
  validates :price, presence: true
  has_many :order_elements
end

class Waiter < ActiveRecord::Base
  has_many :table_orders
  
end

class TableOrder < ActiveRecord::Base
  belongs_to :waiter;
  belongs_to :table
  has_many :order_elements #cannot be used, because of migrations
  validates :order_elements, presence: true #cannot be used because of migrations
  accepts_nested_attributes_for :order_elements
end

class OrderElement < ActiveRecord::Base
  belongs_to :table_order
  belongs_to :meal
  #validates :meal, :table_order, presence: true does not work
end