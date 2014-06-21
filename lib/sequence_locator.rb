class SequenceLocator
  SEQUENCE_LENGTH = 4

  def initialize(dictionary)
    @dictionary = dictionary
    @sequences_and_words = {}
    process_dictionary
  end

  def sequences_and_words(&block)
    @sequences_and_words.each do |sequence, word|
      if block_given?
        block.call(sequence, word)
      else
        yield(sequence, word)
      end
    end
  end

  #private

  def process_dictionary
    word_substrings = search_for_substrings(@dictionary)
  end

  def search_for_substrings(dictionary)
    dictionary.collect do |word|
      substring_from(word)
    end.flatten!.sort
  end

  def substring_from(word)
    substrings = []
    index = word.length - SEQUENCE_LENGTH
    while index > -1 do
      substrings << word[index, SEQUENCE_LENGTH]
      index -= 1
    end
    substrings.reverse
  end
end
