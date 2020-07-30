class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.boolean :is_answer
      t.integer :answer_to
      t.text :post_content

      t.timestamps
    end
  end
end
