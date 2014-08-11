require './lib/card'
class Deck
  attr_reader :cards
  def initialize
    @cards = []
    [:♠, :♦, :♣, :♥].each do |suit|
      13.times do |value|
        @cards << Card.new(value + 1, suit)
      end
    end
  end

  def shuffle
    @shuffled_cards = []
    @cards.each do |card|
      loop do
        random_num = rand(0..51)
        if @shuffled_cards[random_num].nil?
          @shuffled_cards[random_num] = card
          break
        end
      end
    end
    @cards = @shuffled_cards
  end

  def show_order
    @display_cards = []
    @cards.each do |card|
      print [card.value, card.suit]
      puts
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
