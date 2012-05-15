class Upload < ActiveRecord::Base
  attr_accessible :num_records

  has_many :purchases, :dependent => :destroy

  def self.create_from_data(text)
    parser = Parser.new(text)
    result = parser.parse

    upload = Upload.new(:num_records => result.count)
    upload.save

    result.each do |attribute_hash|
      purchase = Purchase.new(attribute_hash)
      if purchase.valid?
        purchase.save
        upload.purchases << purchase
      end
    end

    upload
  end
end
