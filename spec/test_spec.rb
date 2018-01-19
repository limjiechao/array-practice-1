require_relative '../test.rb'

describe String do
  before(:each) do
    @string = String.new('025486')
  end

  describe '#dashes' do
    it 'must be string' do
      expect(@string.class).to eq String
    end

    it 'must contain only digits' do
      expect('abc123'.dashes).to eq 'abc123'
    end

    it 'insert no dashes' do
      expect('1357'.dashes).to eq '1357'
    end

    it 'inserts dashes' do
      expect('2468'.dashes).to eq '2-4-6-8'
    end

    it 'insert dashes between each two even numbers.' do
      expect(@string.dashes).to eq '0-254-8-6'
    end
  end
end

describe Array do
  before(:each) do
    @frequent = Array.new([3, 'a', 'a', 'a', 2, 3, 'a', 3, 'a', 2, 4, 9, 3])
    @duplicate = Array.new([1, 'a', 'A', 'b', 2, 2])
  end

  it 'must be array' do
    expect(@frequent.class).to eq Array
  end

  describe '#frequent' do
    it 'cannot be empty' do
      expect([].frequent).to eq nil
    end

    it 'returns "a (3 times)"' do
      expect(['a', 'a', 'a', 'b' ].frequent).to eq 'a (3 times)'
    end

    it 'returns "a (3 times)"' do
      expect(['x', 'a', 'a', 'b'].frequent).to eq 'a (2 times)'
    end

    it 'returns a string "a (5 times)"' do
      expect(@frequent.frequent).to eq 'a (5 times)'
    end

    it 'same frequency returns unaltered array' do
      expect([1, 1, 2, 2].frequent).to eq nil
    end
  end

  describe '#remove_duplicate' do
    it 'must be array' do
      expect(@duplicate.class).to eq Array
    end

    it 'contains either integer or string' do
      expect([true, [1, 2], {:test => 0}]).to eq [true, [1, 2], {:test => 0}]
    end

    it 'returns [\'abc\', \'b\', \'c\']' do
      expect(['ABC', 'abc', 'b', 'c'].remove_duplicate).to eq ['abc', 'b', 'c']
    end

    it 'remove duplicate items from the array' do
      expect(@duplicate.remove_duplicate).to eq [1, 'a', 'b', 2]
    end
  end
end

# it '#union' do
#   expect(subject).not_to eq object
# end
#
# it 'mergeArray' do
#   expect(subject).not_to eq object
# end
