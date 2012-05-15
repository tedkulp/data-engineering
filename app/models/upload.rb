class Upload < ActiveRecord::Base
  attr_accessible :num_records, :total_revenue

  has_many :purchases, :dependent => :destroy
  belongs_to :user

  # Public: Creates a new Upload model. If given valid tab
  # delimited purchase data, it will also parse the data and
  # create the associated Purchase models. Additionally,
  # if user is passed, the created Upload will belong to
  # the given user.
  #
  # text - A string containing purchase data
  # user - A User model that the created Upload model
  #        should belong to
  #
  # Returns an Upload model, whether or not the data
  # was successfully parsed.
  def self.create_from_data(text, user = nil)
    parser = Parser.new(text)
    result = parser.parse

    upload = Upload.new(:num_records => result.count, :total_revenue => parser.sum_column('item_price'))
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
