class AddTotalRevenueToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :total_revenue, :decimal, :null => false, :default => 0.00, :precision => 8, :scale => 2
  end
end
