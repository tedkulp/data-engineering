class Upload < ActiveRecord::Base
  attr_accessible :num_records

  has_many :purchases, :dependent => :destroy
  belongs_to :user

  def self.create_from_data(text, user = nil)
    parser = Parser.new(text)
    result = parser.parse

    upload = Upload.new(:num_records => result.count)
    unless user.nil?
      upload.user = user
    end
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
