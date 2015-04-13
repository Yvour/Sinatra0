
# -*- coding: utf-8 -*-
class CreateTable < ActiveRecord::Migration
  def self.up
    # создание таблицы с заданными полями
    create_table :tables do |table|
      table.string   :number
      table.text     :description
 
    end
    # тестовые записи
    Table.create(number: "1", description: "Near the window");
    Table.create(number: "2", description: "Near the door");    

  end
  def self.down
    # откатить миграцию (rake:db rollback)
    drop_table :tables
  end
end