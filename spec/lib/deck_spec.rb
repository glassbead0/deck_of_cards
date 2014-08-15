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

      [:♠, :♦, :♣, :♥].each do |suit|
        it "should have 13 #{suit}s" do
          expected_result = subject.cards.select { |card| card.suit == suit }
          expect(expected_result.length).to eq(13)
        end
      end

      ((2..10).to_a + [:A, :J, :Q, :K]).each do |num|
        it "should have 4 #{num}'s" do
          expected_result = subject.cards.select { |card| card.value == num }
          expect(expected_result.length).to eq(4)
        end
      end
    end
  end

  describe '#shuffle' do
    context 'regular shuffle' do
      it 'should return a shuffled deck' do
        shuffled_deck = subject.shuffle
        expect(shuffled_deck.length).to eq(52)
      end

      it 'should not be the same as pre shuffled' do
        unshuffled_deck = subject.cards
        shuffled_deck = subject.shuffle
        expect(unshuffled_deck).to_not eq(shuffled_deck)
      end
    end

    context 'perfect shuffle' do
      it 'should do a perfect shuffle' do
        unshuffled_deck = subject.cards
        8.times do
          subject.perfect_shuffle
        end
        expect(subject.cards).to eq(unshuffled_deck)
      end
    end
  end

  it 'should pick a random card' do
    expect(subject.pick_random_card).to be_a(Card)
  end

  describe '#show_order' do
    it 'should show all cards' do
      expected_result = [[:A, :♠],
                         [2, :♠],
                         [3, :♠],
                         [4, :♠],
                         [5, :♠],
                         [6, :♠],
                         [7, :♠],
                         [8, :♠],
                         [9, :♠],
                         [10, :♠],
                         [:J, :♠],
                         [:Q, :♠],
                         [:K, :♠],
                         [:A, :♦],
                         [2, :♦],
                         [3, :♦],
                         [4, :♦],
                         [5, :♦],
                         [6, :♦],
                         [7, :♦],
                         [8, :♦],
                         [9, :♦],
                         [10, :♦],
                         [:J, :♦],
                         [:Q, :♦],
                         [:K, :♦],
                         [:A, :♣],
                         [2, :♣],
                         [3, :♣],
                         [4, :♣],
                         [5, :♣],
                         [6, :♣],
                         [7, :♣],
                         [8, :♣],
                         [9, :♣],
                         [10, :♣],
                         [:J, :♣],
                         [:Q, :♣],
                         [:K, :♣],
                         [:A, :♥],
                         [2, :♥],
                         [3, :♥],
                         [4, :♥],
                         [5, :♥],
                         [6, :♥],
                         [7, :♥],
                         [8, :♥],
                         [9, :♥],
                         [10, :♥],
                         [:J, :♥],
                         [:Q, :♥],
                         [:K, :♥]
                        ]
      expect(expected_result).to eq(subject.show_order)
    end
  end
end
