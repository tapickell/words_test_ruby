require 'sequence_locator'
require 'dictionary_file'
require 'output_file'

class SequenceLocationManager

  def self.process_file(dictionary_file_name, sequence_file_name, word_file_name)
    self.new(dictionary_file_name, sequence_file_name, word_file_name).locate_sequences
  end

  def initialize(dictionary_file_name, sequence_file_name, word_file_name)
    @dictionary_file = DictionaryFile.new(dictionary_file_name)
    @sequences_file = OutputFile.new(sequence_file_name)
    @words_file = OutputFile.new(word_file_name)
  end

  def locate_sequences
    SequenceLocator.new(@dictionary_file).sequences_and_words.each do |sequence, word|
      @sequences_file.add sequence
      @words_file.add word
    end
  end

end
