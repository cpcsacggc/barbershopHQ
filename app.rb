#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter:'sqlite3', database:'barbershop.db'}
 
class User < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end
before do
	@barbers = Barber.all
	@results = User.all
end

get '/' do
	# @barbers = Barber.order "created_at DESC"
	erb :index
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/showusers' do
 	erb :showusers
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	# хеш
	hh = { 	:username => 'Введите имя',
			:phone => 'Введите телефон',
			:datetime => 'Введите дату и время',
			:barber => 'Выберите Парекмахера',
			:color => 'Выберите цвет покраски волос'
		}

	@error = hh.select {|key,_| params[key] == ""}.values.join(", ")

	if @error != ''
		return erb :visit
	end

	# $db.execute 'insert into Users 
	# (
	# 	username, 
	# 	phone, 
	# 	datestamp,
	# 	barber, 
	# 	color
	# )
	# values
	# (
	# ?, ?, ?, ?, ?
	# )', [@username, @phone, @datetime, @barber, @color]

	erb "<h3>Спасибо, вы записались!</h3>"
end