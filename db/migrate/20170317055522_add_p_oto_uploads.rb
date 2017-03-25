class AddPOtoUploads < ActiveRecord::Migration[5.0]
  def change
    add_column :uploads, :order, :string
  end
end
