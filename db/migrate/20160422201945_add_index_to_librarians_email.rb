class AddIndexToLibrariansEmail < ActiveRecord::Migration
  def change
    add_index :librarians, :email, unique: true
  end
end
