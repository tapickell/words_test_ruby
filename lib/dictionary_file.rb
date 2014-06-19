class DictionaryFile
  include Enumerable
  attr_reader :dictionary

  def initialize(file_name)
    @dictionary = []
    load_from_file file_name
  end

  def each(&block)
    @dictionary.each do |word|
      if block_given?
        block.call word
      else
        yield word
      end
    end
  end

  private

  def load_from_file(file_name)
    File.open(file_name, "r").each do |line|
      @dictionary << line
    end
  end

end
