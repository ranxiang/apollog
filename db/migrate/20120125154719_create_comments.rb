class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :article
      t.string :author_name
      t.string :author_email
      t.string :author_url
      t.string :author_ip
      t.text :content
      t.string :type
      t.integer :parent_id

      t.timestamps
    end
    add_index :comments, :article_id
  end
end
