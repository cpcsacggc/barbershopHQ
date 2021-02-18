class CreateColors < ActiveRecord::Migration[6.1]
  def change
  	create_table :colors do |t|
  		t.text :name
  		t.text :value
  		t.timestamps
  	end
  	     Color.create :name => 'Black', :value =>'#000000'
  	     Color.create :name => 'SaddleBrown', :value =>'#8b4513'
  	     Color.create :name => 'Orange', :value =>'#ffa500'
  	     Color.create :name => 'Green', :value =>'#008000'
  	     Color.create :name => 'Dark blue', :value =>'#00008B'
  	     Color.create :name => 'Blue', :value =>'#0000ff'
  	     Color.create :name => 'Turquoise', :value =>'#40e0d0'
  	     Color.create :name => 'Light green', :value =>'#90ee90'
  	     Color.create :name => 'Dark green', :value =>'#006400'
  	     Color.create :name => 'Yellow', :value =>'#ffff00'
  	     Color.create :name => 'Red', :value =>'#ff0000'
  	     Color.create :name => 'Dark red', :value =>'#8b0000'
		 Color.create :name => 'Purple', :value =>'#800080'
		 Color.create :name => 'Gray', :value =>'#e1e1e1'
  end
end
