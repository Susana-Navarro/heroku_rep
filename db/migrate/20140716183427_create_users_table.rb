class CreateUsersTable < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :fname
  		t.string :lname
  		t.string :bday
  		t.string :email
  		t.string :password
  	end
  end
end
