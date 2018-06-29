class CreateGazorpians < ActiveRecord::Migration[4.2]
  def change
    create_table :gazorpians do |t|
      t.integer :name
      t.string :age
    end
  end
end
