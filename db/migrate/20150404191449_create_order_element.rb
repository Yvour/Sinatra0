# db/migrate/xxx_create_post.rb
# -*- coding: utf-8 -*-

class CreateOrderElement < ActiveRecord::Migration
  def self.up
    create_table :order_elements do |order_element|
      order_element.integer :table_order_id
      order_element.integer :meal_id
      order_element.integer :quantity
      order_element.float :amount
      order_element.timestamps

    end

  OrderElement.create(table_order_id: 1, meal_id: 1, quantity: 1)
  OrderElement.create(table_order_id: 2, meal_id: 2, quantity: 1)


end
  def self.down
    drop_table :order_elements
  end
end
