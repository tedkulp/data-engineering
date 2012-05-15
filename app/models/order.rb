class Order < ActiveRecord::Base
  attr_accessible :customer_id, :item_id, :quantity

  validates :quantity, :presence => true, :numericality => { :greater_than_or_equal_to => 0, :only_integer => true }

  belongs_to :item
  belongs_to :customer
end
