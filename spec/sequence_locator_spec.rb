require 'sequence_locator'

describe SequenceLocator do
  subject { SequenceLocator.new(dictionary) }
  let(:dictionary) { %w{ arrows carrots give me } }
  let(:substrings) { %w{ arro rrow rows } }
  let(:all_substrings) { %w{ arro arro carr give rots rows rrot rrow } }
  let(:sequences_and_words) { {'carr' => 'carrots',
                               'give' => 'give',
                               'rots' => 'carrots',
                               'rows' => 'arrows',
                               'rrot' => 'carrots',
                               'rrow' => 'arrows'} }

  it 'returns a hash for sequences and words' do
    subject.sequences_and_words.should be_a Hash
  end

  it 'returns the correct hash for sequences and words' do
    subject.sequences_and_words.should eq sequences_and_words
  end

end
