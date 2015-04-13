# db/migrate/xxx_create_post.rb
# -*- coding: utf-8 -*-
class CreateMeal < ActiveRecord::Migration
  def self.up
    create_table :meals do |meal|
      meal.string :name
      meal.string :price
      meal.timestamps
    end

  Meal.create(name: "Tea", price: 20.14)
  Meal.create(name: "Roastbeaf", price: 20.22)
  Meal.create(name: "Soup", price: 30.14)
  Meal.create(name: "Salad", price: 10.00)
end
  def self.down
    drop_table :meals
  end
end
