class Deck
  def initialize
    @cards = []
    @rank = [2,3,4,5,6,7,8,9,10, "Jack", "Queen", "King", "Ace"]
    @suit = ["Spades", "Clubs", "Hearts", "Diamonds"]
    @cards =[@rank, @suit]
  end

  def shuffle
    @cards.shuffle!
  end

  puts @cards
