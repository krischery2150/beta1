class AddRememberDigestToLibrarians < ActiveRecord::Migration
  def change
    add_column :librarians, :remember_digest, :string
  end
end
