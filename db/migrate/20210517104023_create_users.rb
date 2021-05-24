class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username
      t.string :password
      t.string :salt

      t.timestamps
    end
  end
end
