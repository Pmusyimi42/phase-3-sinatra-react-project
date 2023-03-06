class AddQuoteIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :quote_id, :integer
  end
end
