class CreateGazorpians < ActiveRecord::Migration
  def change
    create_table :gazorpians do |t|
      t.integer :name
      t.string :age
    end
  end
end
