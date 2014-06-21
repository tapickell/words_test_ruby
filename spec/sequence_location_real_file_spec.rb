require 'sequence_location_manager'

describe SequenceLocationManager do

  describe 'processes real dictionary file from url' do
    let(:real_file_url) { 'https://dl.dropboxusercontent.com/u/14065136/dictionary.txt' }
    let(:sequence_file) { 'real_sequences.txt' }
    let(:word_file) { 'real_words.txt' }

    it 'creates two output files' do
      SequenceLocationManager.process_file(real_file_url, sequence_file, word_file)
      expect(File.exists?(sequence_file)).to be_true
      expect(File.exists?(word_file)).to be_true
    end
  end
end
