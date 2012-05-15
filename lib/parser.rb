# Public: Utility class to turn a given string of multiple lines
# of tab delimited text into an Array of Hash objects.
#
# Examples
#   parser = Parser.new("col1\tcol2\nval1\tval2\nval3\tval4\n")
#   parser.parse
#   # => [
#          {'col1' => 'val1', 'col2' => 'val2'},
#          {'col1' => 'val3', 'col2' => 'val4'},
#        ]
class Parser

  # Public: Gets/Sets the String text that will be parsed
  attr_accessor :text

  # Public: Initialize the parser, optionally with the text to
  # parse.
  #
  # text - A String containing the text to parse
  #
  # Returns a new Parser object instance
  def initialize(text = "")
    @text = text
    reset!
  end

  # Public: Parse the previous given text into a resulting hash
  #
  # Returns an array
  def parse
    reset!

    unless text.nil?
      text.each_line do |line|
        items = parse_line(line)
        unless items.empty?
          if headers?
            set_headers(items)
          else
            items_to_hash(items) do |item_hash|
              @result << item_hash
            end
          end
        end
      end
    end

    @result
  end

  def sum_column(column_name)
    @result.inject(0.0) { |sum, item_hash|
      if item_hash.has_key?(column_name)
        sum + item_hash[column_name].to_f
      else
        sum
      end
    }
  end

  private

  # Private: Parse a tab delimited line of text into an array
  # of values
  #
  # line - The line of text to parse
  #
  # Examples
  #
  #   parse_line("val1\tval2\tval3\tval4\n")
  #   # => [ 'val1', 'val2', 'val3', 'val4' ]
  #
  # Returns an Array of values
  def parse_line(line)
    return [] if line.nil? or line.empty?
    line.chomp("\n").split("\t")
  end

  # Private: Converts an array of items to a hash, keyed on
  # the items in @headers. If the number of items does not
  # match the number of header values, it will not yield
  # and return an empty Hash.
  #
  # items - The array of items to convert into a Hash
  # block - The optional block to send the resulting item
  #
  # Yields the created Hash object
  #
  # Returns the created Hash object
  def items_to_hash(items, &block)
    result = {}
    if items.count == @headers.count
      each_result = items.map.with_index { |item, index|
        [@headers[index].to_s, item]
      }.flatten
      if block_given? and !each_result.empty?
        block.yield(Hash[*each_result]) unless each_result.empty?
      end
    end
    result
  end

  # Private: Looks to see if there are any headers current
  # set
  #
  # Returns a Boolean
  def headers?
    @headers.empty?
  end

  # Private: Sets the headers used for assigning keys
  # to the given values in the result. Additionally, it
  # will convert any headers with a space in the title
  # to having underscores instead.
  #
  # items - An Array of header strings
  #
  # Returns nothing
  def set_headers(items)
    @headers = items.map { |item|
      item.gsub(/ /, '_')
    }
  end

  # Private: Clears out the currently saved headers and
  # results so # they aren't used in future runs of
  # the parse method.
  #
  # Returns nothing
  def reset!
    @headers = []
    @result = []
  end

end
