class Card
  attr_accessor :rank, :suit
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  def output_card
    puts "#{self.rank} of #{self.suit}"
  end
end

class Deck
    SUITS = [:Spades,:Clubs,:Hearts,:Diamonds]
    RANKS = [2,3,4,5,6,7,8,9,10,"Jack","Queen","King","Ace"]
  def initialize
    @deck_of_cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @deck_of_cards << Card.new(rank, suit)
      end
    end
  end

  def shuffle
    @deck_of_cards.shuffle!
  end

  def deal
    @deck_of_cards.shift
  end

  def remaining_cards
    @deck_of_cards.each do |card|
      card.output_card
    end
  end

end

deck = Deck.new
deck.shuffle
deck.deal
deck.remaining_cards
