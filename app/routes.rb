#!/usr/bin/env ruby
# encoding: utf-8
# -*- coding: utf-8 -*-
# app/routes.rb

get '/' do
  @title = 'Заголовок индексной страницы'
  erb :index
end


get '/pdf/all' do


      pdf = PDF::Writer.new
      pdf.select_font "Times-Roman"
      pdf.text "Hello, Ruby.", :font_size => 72, :justification => :center
      pdf.save_as("hello.pdf")
end

# app/routes.rb

# получить главную страницу
# отобрать последние 10 столов
get '/tables' do
  # сортировка и указание лимита
  @tables = Table.order('number').limit(10)
  # для отображения взять /views/index.erb
  erb :'tables/index'
end

# получить отдельный стол по его ID
get '/tables/:id/' do
  # найти стол
  @table = Table.find(params[:id])
  @number = @table.number
  @description = @table.description
  erb :'tables/show'
end

# получаем страницу с формой редактирования
get '/tables/:id/edit/' do
  @title = 'Update table'
  @table = Table.find(params[:id])
  erb :'tables/edit'
end

# обновляем данные
put '/tables/:id/edit/' do
  @table = Table.find(params[:id])
  if @table.update_attributes(params[:table])
    redirect to '/'
  else
    erb :'tables/edit'
  end
end

# получить страницу
get '/tables/:id/delete/' do
  @title = 'Confirm deletion of table ##{params[:id]}'
  @table = Table.find(params[:id])
  erb :'tables/delete'
end

# удалить публикацию
delete '/tables/:id/' do
  Table.find(params[:id]).destroy
  redirect to '/tables'
end


# отобразить форму для создания нового стола
get '/tables/new' do
  @number = 'Create new table'
  erb :'tables/create'
end

# взять параметры из формы и сохранить стол
post '/tables/new' do
  params.delete 'submit'
  @table = Table.create(params)
  if @table.save
    redirect to '/'
  else
    'Table was not save'
  end
end


# Блюда
get '/meals' do
  # сортировка и указание лимита
  @meals = Meal.order('name').limit(10)
  # для отображения взять /views/index.erb
  erb :'meals/index'
end

# получить отдельный стол по его ID
get '/meals/:id/' do
  # найти стол
  @meal = Meal.find(params[:id])
  @name = @meal.name
  @price = @meal.price
  erb :'meals/show'
end

# получаем страницу с формой редактирования
get '/meals/:id/edit/' do
  @title = 'Update meal'
  @meal = Meal.find(params[:id])
  erb :'meals/edit'
end

# обновляем данные
put '/meals/:id/edit/' do
  @meal = Meal.find(params[:id])
  if @meal.update_attributes(params[:meal])
    redirect to '/'
  else
    erb :'meals/edit'
  end
end

# получить страницу
get '/meals/:id/delete/' do
  @title = 'Confirm deletion of meal ##{params[:id]}'
  @meal = Meal.find(params[:id])
  erb :'meals/delete'
end

# удалить публикацию
delete '/meals/:id/' do
  Meal.find(params[:id]).destroy
  redirect to '/meals'
end


# отобразить форму для создания нового стола
get '/meals/new' do
  @name = 'Create new meal'
  erb :'meals/create'
end

# взять параметры из формы и сохранить стол
post '/meals/new' do
  params.delete 'submit'
  @meal = Meal.create(params)
  if @meal.save
    redirect to '/'
  else
    'meal was not save'
  end
end



# получить главную страницу
# отобрать последние 10 столов
get '/table_orders' do
  # сортировка и указание лимита
  @table_orders = TableOrder.order('created_at').limit(10)
  # для отображения взять /views/index.erb
  erb :'table_orders/index'
end

# получить отдельный стол по его ID
get '/table_orders/:id/' do
  # найти стол
  @table_order = TableOrder.find(params[:id])

  erb :'table_orders/show'
end

# получаем страницу с формой редактирования
get '/table_orders/:id/edit/' do
  @title = 'Update table_order'
  @table_order = TableOrder.find(params[:id])
  erb :'table_orders/edit'
end

# обновляем данные
put '/table_orders/:id/edit/' do
  @table_order = TableOrder.find(params[:id])
  if @table_order.update_attributes(params[:table_order])
    redirect to '/'
  else
    erb :'table_orders/edit'
  end
end

# получить страницу
get '/table_orders/:id/delete/' do
  @title = 'Confirm deletion of table_order ##{params[:id]}'
  @table_order = TableOrder.find(params[:id])
  erb :'table_orders/delete'
end

# удалить публикацию
delete '/table_orders/:id/' do
  TableOrder.find(params[:id]).destroy
  redirect to '/table_orders'
end


# отобразить форму для создания нового стола
get '/table_orders/new' do
  @number = 'Create new table_order'
  @waiters = Waiter.all
  @tables = Table.all
  @meals = Meal.all
  erb :'table_orders/create'
end

# взять параметры из формы и сохранить стол
post '/table_orders/new' do
  params.delete 'submit'
  p params.class
  p params
  table_order_params = params['table_order'];
  order_elements = table_order_params[ 'order_elementes'] ;
  table_order_params.delete('order_elementes')


  
  p order_elements
  
  puts table_order_params
  p table_order_params
  @table_order = TableOrder.new(table_order_params)
  total_amount = 0.0
  elements = order_elements.values.map{|value |
    p 'value'
    p value
    if (value['meal_id'].to_i > 0)
      
    meal = Meal.find(value['meal_id'].to_i);
    puts "meal"
    puts meal
    amount = value['quantity'].to_i * meal.price.to_f;
    o = OrderElement.new(meal: meal, quantity: value['quantity'], amount: amount);

    total_amount += amount;
    @table_order.order_elements << o
       end
    }

  @table_order.amount = total_amount;
  
  if @table_order.save  #if saves all including elements, but fails if validate presence of elements
    
    
    redirect to '/table_orders'
  else
    p @table_order.errors
    'TableOrder was not save'
  end
end


# если страница не найдена
not_found do
  @title = 'Page not found'
  # создайте для неё шаблон 404.erb
  erb :'404'
end

# обработка ошибки сервера
error do
  @error = request.env['sinatra_error'].name
  erb :'500'
end