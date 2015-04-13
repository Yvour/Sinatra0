# db/migrate/xxx_create_post.rb
# -*- coding: utf-8 -*-
class CreateWaiter < ActiveRecord::Migration
  def self.up
    create_table :waiters do |waiter|
      waiter.string :waiter_name
      waiter.timestamps

    end

  Waiter.create(waiter_name: "Edmond Blackadder")
  Waiter.create(waiter_name: "Quentin Durward")
  Waiter.create(waiter_name: "Walter Scott")

end
  def self.down
    drop_table :waiters
  end
end
