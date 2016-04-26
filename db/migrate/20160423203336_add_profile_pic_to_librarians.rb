class AddProfilePicToLibrarians < ActiveRecord::Migration
  def up
    add_attachment :librarians, :profile_pic, :attachment
  end

  def down
    remove_attachment :librarians, :profile_pic, :attachment
  end
end
