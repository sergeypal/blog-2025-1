class CreateLikeComments < ActiveRecord::Migration[8.0]
  def change
    create_table :like_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
