
class Card
  attr_reader :suit
  attr_reader :value
  attr_reader :face_up
  def initialize(suit, value)
    get_suit(suit)
    get_value(value)
    @face_up = false
  end

  def get_suit(suit)
    if %w(spade heart club diamond).include?(suit)
      @suit = suit
    else
      fail(ArgumentError, 'not a valid suit')
    end
  end

  def get_value(value)
    @value = value
    @value = 'A' if value == 1
    @value = 'J' if value == 11
    @value = 'Q' if value == 12
    @value = 'K' if value == 13
    if value < 1 || value > 13
      fail(ArgumentError, 'not a valid number')
    end
  end

  def flip
    @face_up = true ^ @face_up # switches the truthyness of @face_up?
  end
end
