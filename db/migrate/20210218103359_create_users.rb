class CreateUsers < ActiveRecord::Migration[6.1]
  def change
  	 create_table :users do |t|
      t.text :name
      t.text :phone
      t.text :datestamp
      t.text :barber
      t.text :color

      t.timestamps
    end
  end
end
