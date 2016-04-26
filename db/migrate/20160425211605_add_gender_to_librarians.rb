class AddGenderToLibrarians < ActiveRecord::Migration
  def change
    add_column :librarians, :gender, :string
  end
end
