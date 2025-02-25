class CreateLikeArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :like_articles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
