require 'spec_helper'

describe Normalizer do

  let(:data) { File.open(File.dirname(__FILE__) + "/../../example_input.tab", "r").read }

  describe '.normalize' do
    it "should normalize valid data" do
      parser = Parser.new(data)
      result = parser.parse

      result.each do |item_hash|
        Normalizer.normalize(item_hash)
      end

      Merchant.count.should eq(3)
      Item.count.should eq(3)
      Order.count.should eq(4)
      Customer.count.should eq(3)
    end

    it "should not recreate items if they exist (except for orders)" do
      parser = Parser.new(data)
      result = parser.parse

      result.each do |item_hash|
        Normalizer.normalize(item_hash)
      end

      result.each do |item_hash|
        Normalizer.normalize(item_hash)
      end

      Merchant.count.should eq(3)
      Item.count.should eq(3)
      Order.count.should eq(8)
      Customer.count.should eq(3)

    end

    it "should not do anything if the hash is invalid" do
      Normalizer.normalize({})

      Merchant.count.should eq(0)
      Item.count.should eq(0)
      Order.count.should eq(0)
      Customer.count.should eq(0)
    end
  end

end
