class CreateTopStories < ActiveRecord::Migration
  def change
    create_table :top_stories do |t|

      t.timestamps
    end
  end
end
