class Item < ActiveRecord::Base
  attr_accessible :description, :merchant_id, :price

  validates :description, :presence => true
  validates :price, :presence => true, :numericality => { :greater_than_or_equal_to => 0.0 }

  has_many :orders
  belongs_to :merchant
end
