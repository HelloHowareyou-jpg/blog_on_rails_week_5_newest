class AddViewCountToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :view_count, :integer
  end
end


