require 'rspec'
require './lib/deck'

describe Deck do
  it 'should Be a deck of cards' do
    expect(subject).to be_a(Deck)
  end

  describe '#cards' do
    context 'should have all cards' do
      it 'should have 52 cards' do
        expect(subject.cards.length).to eq(52)
      end

      %w(heart diamond spade club).each do |suit|
        it "should have 13 #{suit}s" do
          expected_result = subject.cards.select { |card| card.suit == suit }
          expect(expected_result.length).to eq(13)
        end
      end

      ((2..10).to_a + %w(A J Q K)).each do |num|
        it "should have 4 #{num}'s" do
          expected_result = subject.cards.select { |card| card.value == num }
          expect(expected_result.length).to eq(4)
        end
      end
    end
  end

  describe '#shuffle' do
    it 'should return a shuffled deck' do
      shuffled_deck = subject.shuffle
      expect(shuffled_deck.length).to eq(52)
    end

    it 'should not be the same as pre shuffled' do
      unshuffled_deck = subject.cards
      shuffled_deck = subject.shuffle
      expect(unshuffled_deck == shuffled_deck).to eq(false)
    end
  end

  it 'should pick a random card' do
    expect(subject.pick_random_card).to be_a(Card)
  end
end
