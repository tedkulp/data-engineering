class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.integer :num_records, :null => false, :default => 0

      t.timestamps
    end
  end
end
