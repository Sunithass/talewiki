class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :comment_body
      t.date :submission_date
      t.integer :tale_id, :null => false, :options => "CONSTRAINT fk_comment_tale REFERENCES tales(id)"
      t.integer :user_id, :null => false, :options => "CONTRAINT fk_comment_user REFERENCES users(id)"

      t.timestamps
    end
  end
def self.down
drop_table :comments
end
end
