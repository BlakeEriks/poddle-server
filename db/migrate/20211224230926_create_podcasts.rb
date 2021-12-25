class CreatePodcasts < ActiveRecord::Migration[6.1]
  def change
    create_table :podcasts do |t|
      t.string :api_id
      t.string :title
      t.string :publisher
      t.string :image
      t.integer :total_episodes
      t.string :description
      t.string :website

      t.timestamps
    end
  end
end
