class AddAvatarColumnsToUploads < ActiveRecord::Migration
  def up
    add_attachment :uploads, :avatar
  end

  def down
    remove_attachment :uploads, :avatar
  end
end