require 'sequence_location_manager'

describe SequenceLocationManager do

  describe 'processes dictionary file' do
    let(:test_file) { 'test_dictionary.txt' }
    it 'creates two output files' do
      SequenceLocationManager.process_file(test_file)
      expect(File.exists?('sequences.txt')).to be_true
      expect(File.exists?('words.txt')).to be_true
    end
  end
end
