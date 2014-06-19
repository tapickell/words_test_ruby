class SequenceLocator
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

  private

  def process_dictionary
    #inject may be helpful here to avoid n+1

  end
end
