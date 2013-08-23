class CreateBoots < ActiveRecord::Migration
  def self.up
    create_table :boots do |t|
      t.integer :dbc_id
      t.string :cohort
      t.string :name
      t.string :email
      t.text :github
      t.text :quora
      t.text :twitter
      t.text :facebook
      t.text :linked_in
      t.text :blog
      t.text :hacker_news
      t.timestamps
    end
  end

  def self.down
    drop_table :boots
  end
end
