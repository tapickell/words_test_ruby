class SequenceLocator
  SEQUENCE_LENGTH = 4

  def initialize(dictionary)
    @dictionary = dictionary
    @sequences_and_words = {}
    process_dictionary
  end

  def sequences_and_words(&block)
    if true
      return @sequences_and_words
    else
      @sequences_and_words.each do |sequence, word|
        if block_given?
          block.call(sequence, word)
        else
          yield(sequence, word)
        end
      end
    end
  end

  #private

  def process_dictionary
    search_for_substrings(@dictionary)
  end

  def search_for_substrings(dictionary)
    dictionary.each do |word|
      get_substring_from(word)
    end
  end

  def get_substring_from(word)
    index = word.length - SEQUENCE_LENGTH
    while index > -1 do
      substring = word[index, SEQUENCE_LENGTH]
      if @sequences_and_words[substring]
        @sequences_and_words.delete(substring)
      else
        @sequences_and_words[substring] = word
      end
      index -= 1
    end
  end
end
