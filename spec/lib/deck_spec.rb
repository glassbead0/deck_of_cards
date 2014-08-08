require 'rspec'
require './lib/deck'

describe Deck do
  it 'should Be a deck of cards' do
    expect(subject).to be_a(Deck)
  end

  it 'should have 52 cards' do
    expect(subject.cards.length).to eq(52)
  end

  describe '#shuffle' do
    it 'should return a shuffled deck' do
      expect(subject.shuffle.length).to eq(52)
    end
  end

  it 'should pick a random card' do
    expect(subject.pick_random_card).to be_a(Card)
  end
end
