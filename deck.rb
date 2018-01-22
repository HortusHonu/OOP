#Runs on Card.new
class Card
  #Allows to be accessed outside the Card class
  attr_accessor :rank, :suit

  #Runs on Card.new and stores rank and suit as instance variable assigned to object Card
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  #Outputs the remaining cards less the top card from the deck to the screen - ***self gives access to object Card(rank, suit)
  def output_card
    puts "#{self.rank} of #{self.suit}"
  end

end

#Runs on Deck.new
class Deck
    #Arrays for card ranks and suits
    SUITS = [:Spades,:Clubs,:Hearts,:Diamonds]
    RANKS = [2,3,4,5,6,7,8,9,10,"Jack","Queen","King","Ace"]
  def initialize
    #Creates an empty array (deck_of_cards)
    @deck_of_cards = []
    #For each suit element add one each of rank element
    SUITS.each do |suit|
      #For each rank element add a rank/suit combo to deck_of_cards
      RANKS.each do |rank|
        @deck_of_cards << Card.new(rank, suit)
      end
    end
  end

  #Randomize the deck_of_cards array
  def shuffle
    @deck_of_cards.shuffle!
  end

  #Remove the first element of the deck_of_cards array and slide elements to the left
  def deal
    @deck_of_cards.shift
  end

  #For each remaining element of deck_of_cards array call output.card method
  def remaining_cards
    @deck_of_cards.each do |card|
      card.output_card
    end
  end

end

#Runs initialize portion of class Deck
deck = Deck.new
#Runs shuffle method
deck.shuffle
#Runs Deal method
deck.deal
#Runs remaining card method
deck.remaining_cards
