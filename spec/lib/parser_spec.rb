require 'spec_helper'

describe Parser do

  describe ".new" do
    it "creates a Parser object" do
      lambda { Parser.new() }.should_not raise_exception
      Parser.new.text.should be_empty
    end

    it "optionally takes a string" do
      test_text = "test"
      lambda { Parser.new(test_text) }.should_not raise_exception
      Parser.new(test_text).text.should eq(test_text)
    end
  end

  describe ".parse" do
    let(:parser) { Parser.new }

    it "returns an array of hashes" do
      parser.text = ""
      parser.parse.should_not be_nil
      parser.parse.should be_empty
    end

    it "will parse the first row as headers" do
      parser.text = "col1\tcol2\nval1\tval2\n"
      parser.parse.should eq(['col1' => 'val1', 'col2' => 'val2'])
    end

    it "will not return anything if there is only one row" do
      parser.text = "col1\tcol2\n"
      parser.parse.should be_empty
    end

    it "will convert headers with spaces to underscores" do
      parser.text = "some value\tsomething\nvalue 1\tvalue 2\n"
      parser.parse.should.should eq([{'some_value' => 'value 1', 'something' => 'value 2'}])
    end

    it "will skip a row if there number of columns in a row doesn't match the number in the header" do
      parser.text = "col1\tcol2\nval1\n"
      parser.parse.should be_empty
      parser.text = "col1\tval1\nval2\n"
      parser.parse.should be_empty
    end
  end
end
