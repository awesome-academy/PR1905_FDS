class CreateDownloads < ActiveRecord::Migration[5.2]
  def change
    create_table :downloads do |t|
      t.integer :user_id
      t.integer :document_id

      t.timestamps
    end
  end
end
