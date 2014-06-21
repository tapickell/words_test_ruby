class SequenceLocator
  SEQUENCE_LENGTH = 4

  def initialize(dictionary)
    @dictionary = dictionary
    @sequences_and_words = {}
    search_for_substrings
  end

  def sequences_and_words(&block)
    if block_given?
      @sequences_and_words.each do |sequence, word|
        block.call(sequence, word)
      end
    else
      @sequences_and_words
    end
  end

  private

  def search_for_substrings
    @dictionary.each { |word| get_substring_from(word) }
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
