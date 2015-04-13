# db/migrate/xxx_create_post.rb
# -*- coding: utf-8 -*-

class CreateTableOrder < ActiveRecord::Migration
  def self.up
    create_table :table_orders do |table_order|
      table_order.integer :waiter_id
      table_order.integer :table_id
      table_order.float :amount
      table_order.timestamps

    end

  TableOrder.create(waiter_id: 1, table_id: 1)
  TableOrder.create(waiter_id: 2, table_id: 2)


end
  def self.down
    drop_table :table_orders
  end
end
