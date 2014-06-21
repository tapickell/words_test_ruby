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

  it 'finds the substrings in each word' do
    subject.get_substrings(dictionary.first).should eq substrings
  end

  it 'returns all possible substrings from the dictionary' do
    subject.search_for_substrings(dictionary).should eq all_substrings
  end
end
