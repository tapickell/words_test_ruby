require 'sequence_location_manager'

describe SequenceLocationManager do

  describe 'processes dictionary file' do
    let(:dictionary_file) { 'test_dictionary.txt' }
    let(:sequence_file) { 'test_sequences.txt' }
    let(:word_file) { 'test_words.txt' }

    it 'creates two output files' do
      SequenceLocationManager.process_file(dictionary_file, sequence_file, word_file)
      expect(File.exists?(sequence_file)).to be_true
      expect(File.exists?(word_file)).to be_true
    end
  end
end
