require './lib/card'
class Deck
  attr_reader :cards
  def initialize
    @cards = []
    13.times do |value|
      @cards << Card.new('spade', value + 1)
      @cards << Card.new('diamond', value + 1)
      @cards << Card.new('club', value + 1)
      @cards << Card.new('heart', value + 1)
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

  def perfect_shuffle
    
  end

  def pick_random_card
    @cards[rand(0..51)]
  end
end
