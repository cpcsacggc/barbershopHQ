#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter:'sqlite3', database:'barbershop.db'}
 
class User < ActiveRecord::Base
  	validates :name, presence: true
	validates :phone, presence: true
  	validates :datestamp, presence: true
 	validates :barber, presence: true
 	validates :color, presence: true
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

class Color < ActiveRecord::Base
end

before do
	@colors = Color.all
	@barbers = Barber.all
	@results = User.all
	@contacts = Contact.all
	@u = User.new params[:user]
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

	@u = User.new params[:user]
	@u.save
	if @u.save
		erb "<h3>Спасибо, вы записались!</h3>"
	else
		# @error = @u.errors.full_messages.first
		err_arr = @u.errors.full_messages
			err_arr.each do |msg|
				@error = msg
			end
		erb :visit
	end
end