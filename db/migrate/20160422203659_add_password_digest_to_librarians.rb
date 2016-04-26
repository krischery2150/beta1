class AddPasswordDigestToLibrarians < ActiveRecord::Migration
  def change
    add_column :librarians, :password_digest, :string
  end
end
