class AddStatusAndNameToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :status, "ENUM('TRASH', 'AUTO_DRAFT', 'DRAFT', 'PUBLISH')", :default => :DRAFT
    add_column :articles, :name, :string
  end
end
