require 'dictionary_sequence_locator'

describe DictionarySequenceLocator do

  describe 'processes dictionary file' do
    test_file = 'test_dictionary.txt'

    it 'loads a file' do
      DictionarySequenceLocator.process_file(test_file)
    end

    it 'creates two output files' do
      DictionarySequenceLocator.process_file(test_file)
      expect(File.exists?('sequences.txt')).to be_true
      expect(File.exists?('words.txt')).to be_true
    end
  end
end
