class AddTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :authentication_token, :string, limit: 30 #authentication_token haceque se genera de forma aleatoria el token con la gema
    add_index :users, :authentication_token, unique: true
  end
end
