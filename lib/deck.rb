require './lib/card'
class Deck
  attr_reader :cards
  def initialize # will create the @cards array with all 52 cards in order
    @cards = []
    [:♠, :♦, :♣, :♥].each do |suit| # loop through the suits
      13.times do |value|           # loop through the values
        @cards << Card.new(value + 1, suit)
      end
    end
  end

  def shuffle # returns the @cards in random order
    @old_deck = @cards
    @new_deck = []
    52.times do |a|
      rand = rand(@old_deck.length)
      @new_deck[a] = @old_deck[rand]
      @old_deck.delete_at(rand)
    end
    @cards = @new_deck
  end

  def show_order # shows the current order of the cards in a more readable format
    @display_cards = []
    @cards.each do |card|
      @display_cards << [card.value, card.suit]
    end
    @display_cards
  end

  def perfect_shuffle # technically, a perfect faro out-shuffle
    @temp_deck = []
    b = 26
    26.times do |a|
      @temp_deck << @cards[a]
      @temp_deck << @cards[b]
      b += 1
    end
    @cards = @temp_deck
  end

  def pick_random_card
    @cards[rand(0..51)]
  end
end
