class ChangeDatatypeForAuthorId < ActiveRecord::Migration[6.1]
  def change
    change_column :quotes, :author_id, :integer
  end
end
