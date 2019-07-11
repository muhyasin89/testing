class AddUserTable < ActiveRecord::Migration
  def change
      create_table :users do |t|
        t.column "email", :string, :limit => 50, :null => false
        t.column "firstname", :string, :limit => 30, :null => false
        t.column "lastname", :string,  :limit => 30, :null => false
        t.column "password", :string,:null => false
        t.column "password_digest", :string, :null => false
        t.column "salt", :string
        t.timestamps null: false
      end
  end

  def down
    drop_table :users
  end
end
