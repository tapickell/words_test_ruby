class SequenceLocator
  SEQUENCE_LENGTH = 4
  attr_reader :sequences_and_words

  def initialize(dictionary)
    @dictionary = dictionary
    @sequences_and_words = {}
    process_dictionary
  end

  private

  def process_dictionary
    search_for_substrings
    sort_sequences_and_words
  end

  def search_for_substrings
    @dictionary.each { |word| get_substring_from(word) }
  end

  def sort_sequences_and_words
    @sequences_and_words = @sequences_and_words.sort.to_h
  end

  def get_substring_from(word)
    index = word.length - SEQUENCE_LENGTH
    while index > -1 do
      process_substring(word[index, SEQUENCE_LENGTH], word)
      index -= 1
    end
  end

  def process_substring(substring, word)
    if @sequences_and_words[substring]
      @sequences_and_words.delete(substring)
    else
      @sequences_and_words[substring] = word
    end
  end
end
