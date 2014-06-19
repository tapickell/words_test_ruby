require 'sequence_locator'
require 'dictionary_file'
require 'output_file'

class SequenceLocationManager

  def self.process_file(file_name)
    self.new(file_name).locate_sequences
  end

  def initialize(file_name)
    @dictionary_file = DictionaryFile.new(file_name)
    @sequences_file = OutputFile.new("sequences.txt")
    @words_file = OutputFile.new("words.txt")
  end

  def locate_sequences
    SequenceLocator.new(@dictionary_file).sequences_and_words.each do |sequence, word|
      @sequences_file.add sequence
      @words_file.add word
    end
  end

end
