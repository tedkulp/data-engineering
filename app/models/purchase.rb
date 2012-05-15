class Purchase < ActiveRecord::Base
  attr_accessible :item_description, :item_price, :merchant_address, :merchant_name, :purchase_count, :purchaser_name

  belongs_to :upload

  validates :purchaser_name, :presence => true
  validates :item_description, :presence => true
  validates :item_price, :presence => true, :numericality => { :greater_than_or_equal_to => 0.0 }
  validates :purchase_count, :presence => true, :numericality => { :greater_than_or_equal_to => 0, :only_integer => true }
  validates :merchant_address, :presence => true
  validates :merchant_name, :presence => true
end
