class Normalizer

  def self.normalize(item_hash)
    merchant = Merchant.find_or_create_by_name_and_address(item_hash['merchant_name'], item_hash['merchant_address'])
    customer = Customer.find_or_create_by_name(item_hash['purchaser_name'])
    item = Item.find_or_create_by_description_and_price_and_merchant_id(item_hash['item_description'], item_hash['item_price'], merchant.id) unless merchant.nil?
    Order.create(:customer_id => customer.id, :item_id => item.id, :quantity => item_hash['purchase_count']) unless customer.nil? or item.nil?
  end

end
