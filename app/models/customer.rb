class Customer < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true

  has_many :orders
end
