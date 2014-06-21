require 'open-uri'

class DictionaryFile
  include Enumerable
  attr_reader :dictionary

  def initialize(file_name)
    @dictionary = []
    load_dictionary file_name
  end

  def each
    @dictionary.each do |word|
      yield word
    end
  end

  private

  def load_dictionary(file_name)
    open(file_name) do |file|
      file.each_line do |line|
        @dictionary << line.chomp
      end
    end
  end

end
