class CreateTales < ActiveRecord::Migration
  def self.up
    create_table :tales do |t|
      t.string :title
      t.text :body_text
      t.date :submission_date
      t.string :source
      t.string :status
      t.integer :genre_id, :null => false, :options => "CONSTRAINT fk_tale_genre REFERENCES genres(id)"
      t.integer :user_id, :null => false, :options => "CONSTRAINT fk_tale_user REFERENCES users(id)"
      t.timestamps
    end
  end
def self.down
drop_table :tales
end
end