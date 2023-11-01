class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user, index: true
      t.references :article, index: true

      t.timestamps
    end
  end
end
