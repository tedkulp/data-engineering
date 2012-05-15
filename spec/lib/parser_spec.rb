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
      parser.text = "some value\tsomething else is here\nvalue 1\tvalue 2\n"
      parser.parse.should.should eq([{'some_value' => 'value 1', 'something_else_is_here' => 'value 2'}])
    end

    it "will skip a row if there number of columns in a row doesn't match the number in the header" do
      parser.text = "col1\tcol2\nval1\n"
      parser.parse.should be_empty
      parser.text = "col1\tval1\nval2\n"
      parser.parse.should be_empty
    end
  end

  describe ".sum_column" do
    let(:parser) { Parser.new }

    it "returns 0 if parse hasn't been run yet" do
      parser.sum_column('test').should be_zero
    end

    it "returns 0 if there is no valid data" do
      parser.text = "Blah blah blah"
      parser.sum_column('test').should be_zero
    end

    it "returns 0 if the column doesn't exist" do
      parser.text = "col1\n1.5\n3.0\n1.0"
      parser.parse
      parser.sum_column('test').should be_zero
    end

    it "returns the sum of a column after parse" do
      parser.text = "col1\n1.5\n3.0\n1.0"
      parser.parse
      parser.sum_column('col1').should eq(5.5)
    end

    it "quietly ignores non-numerical data" do
      parser.text = "col1\n1.5\nq\n1.0"
      parser.parse
      parser.sum_column('col1').should eq(2.5)
    end
  end
end
