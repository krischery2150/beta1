class AddDateOfBirthToLibrarians < ActiveRecord::Migration
  def change
    add_column :librarians, :birth_month, :integer
    add_column :librarians, :birth_day, :integer
    add_column :librarians, :birth_year, :integer
  end
end
