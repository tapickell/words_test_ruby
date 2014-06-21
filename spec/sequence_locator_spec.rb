require 'sequence_locator'

describe SequenceLocator do
  subject { SequenceLocator.new(dictionary) }
  let(:dictionary) { %w{ arrows carrots give me } }
  let(:sequences_and_words) { {'carr' => 'carrots',
                               'give' => 'give',
                               'rots' => 'carrots',
                               'rows' => 'arrows',
                               'rrot' => 'carrots',
                               'rrow' => 'arrows'} }


  it 'returns the correct hash for sequences and words' do
    subject.sequences_and_words.should eq sequences_and_words
  end

end
