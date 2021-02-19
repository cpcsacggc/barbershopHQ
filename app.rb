#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter:'sqlite3', database:'barbershop.db'}

class User < ActiveRecord::Base
  	validates :name, presence: true, length: { minimum: 3}
  	#validates_each :name do |record, attr, value|
  	#	record.errors.add(attr, 'must start with upper case') if value =~/\A[[:lower:]]/
  	#end
  	validates :phone, presence:true, length:{ is: 10}, numericality: {only_integer:true}
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
  @results = User.all
 	erb :showusers
end

get '/about' do
	erb :about
end



get '/contacts' do
	erb :contacts
end
get '/visit' do

	erb :visit
end
post '/visit' do
	@u = User.new params[:user]
	@u.save
	if @u.save
		erb "<h3>Спасибо, вы записались!</h3>"
	else
		@error = @u.errors.full_messages.first
		# @error = @u.errors.count
		#

		# err_arr = @u.errors.full_messages
		# @error = err_arr.join(", ")
		# @u.errors.clear
		# err_arr.each{|x| @error = "#{x}, "}
			# err_arr.each do |msg|
			# 	@error = msg
			# end
		erb :visit
	end
end
get '/barber/:id' do
	@barber = Barber.find(params[:id])
	erb :barber
end
