class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :user_name
      t.string :encrypted_password
      t.string :salt
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :email
      t.string :country
      t.integer :role_id, :null => false, :options => "CONSTRAINT fk_user_role REFERENCES roles(id)" 

      t.timestamps
    end
end

 def self.down
  drop_table :users
 end
end
