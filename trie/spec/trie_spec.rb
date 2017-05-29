# Pronounced "tree"
describe Trie do
  before :each do
    @trie = Trie.new
  end
  #
  # context 'initialization' do
  #   it 'should initialize with a new TrieNode' do
  #     expect(@trie.root.class).to eq Trie::TrieNode
  #   end
  #
  #   # it 'should initialize with a property isLeaf' do
  #   #   expect(@trie.root.respond_to?(:is_leaf)).to eq true
  #   # end
  #
  #   it 'should intialize with a property children' do
  #     expect(@trie.root.respond_to?(:children)).to eq true
  #   end
  #
  #   # it 'isLeaf should be boolean' do
  #   #   expect(@trie.root.is_leaf).to eq false
  #   # end
  #
  #   it 'children should be a hash' do
  #     expect(@trie.root.children.class).to eq Hash
  #   end
  # end
  #
  # context 'insertion' do
  #   before :each do
  #     @trie.insert('ace') # initial prefix
  #     @trie.insert('acer')
  #     @trie.insert('aces')
  #     @trie.insert('actor')
  #   end
  #   it 'should insert a word' do
  #     # (a)
  #     #  |
  #     # (c)
  #     #  |
  #     # (e)
  #     expect(@trie.root.children.keys[0]).to eq 'a'
  #     expect(@trie.root.children['a'].children.keys[0]).to eq 'c'
  #     expect(@trie.root.children['a'].children['c'].children.keys[0]).to eq 'e'
  #   end
  #
  #   it 'should only append if word already contains prefix' do
  #     #   (a)
  #     #    |
  #     #   (c)
  #     #    |
  #     #   (e)
  #     #   /
  #     # (r)
  #     expect(@trie.root.children['a'].children['c'].children['e'].children.keys[0]).to eq 'r'
  #   end
  #
  #   it 'should add a second key if there is an existing key at same height' do
  #     #   (a)
  #     #    |
  #     #   (c)
  #     #    |
  #     #   (e)
  #     #   / \
  #     # (r) (s)
  #     expect(@trie.root.children['a'].children['c'].children['e'].children.keys[1]).to eq 's'
  #   end
  #
  #   it 'should add a new word only where the prefix matches' do
  #     #   (a)
  #     #    |
  #     #   (c)
  #     #    |      \
  #     #   (e)    (t)
  #     #   / \     |
  #     # (r) (s)  (o)
  #     #           |
  #     #          (r)
  #     expect(@trie.root.children['a'].children['c'].children['t'].children['o'].children.keys[0]).to eq 'r'
  #   end
  # end

  context 'hackerrank' do
    before :each do
      @trie.insert('hack')
      @trie.insert('hackerrank')
    end

    it 'should determine if how many words in the trie start with the given prefix' do
      # puts @trie.root.children
      expect(@trie.starts_with('hac')).to eq 2
      expect(@trie.starts_with('hak')).to eq 0
    end
  end

  context 'search' do
    before :each do
      # @trie.insert('ace') # initial prefix
      @trie.insert('acer')
      @trie.insert('aces')
      @trie.insert('actor')
      @trie.insert('actress')
      @trie.insert('acton')
    end

    it 'should determine if a word exists in the trie' do
      expect(@trie.search('aces')).to eq true
    end

    it 'should return false if the word does not exist in the trie' do
      expect(@trie.search('ace')).to eq false
    end

    it 'should determine if how many words in the trie start with the given prefix' do
      expect(@trie.starts_with('b')).to eq 0
      expect(@trie.starts_with('ac')).to eq 5
      expect(@trie.starts_with('ace')).to eq 2
      expect(@trie.starts_with('act')).to eq 3
      expect(@trie.starts_with('acto')).to eq 2
      expect(@trie.starts_with('actor')).to eq 1
    end
  end
end
