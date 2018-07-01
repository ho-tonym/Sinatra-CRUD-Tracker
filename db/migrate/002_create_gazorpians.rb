class CreateGazorpians < ActiveRecord::Migration[4.2]
  def change
    create_table :gazorpians do |t|
      t.integer :user_id
      t.string :name
      t.integer :age
    end
  end
end
