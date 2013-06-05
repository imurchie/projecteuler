class Hand
  include Comparable
  
  attr_reader :id
  
  def initialize(id, cards)
    @id = id
    @cards = cards.sort
    
    #p @cards
    
    @hand = Hash.new(false)
    
    if straight?
      if same_suit?
        if @cards[0] == "T"
          # royal flush
          @hand[:royal_flush] = true
        else
          # straight flush
          @hand[:straight_flush] = @cards[0]
        end
      else
        # straight
        @hand[:straight] = true
      end
    else
      # we don't have a straight
      # multiple of any?
      hist = multiples
      if hist[0][0] == 4
        # four of a kind
        @hand[:four_of_a_kind] = hist[0][1]
      elsif hist[0][0] == 3
        # three of a kind
        if hist[1][0] == 2
          # full house!
          @hand[:full_house] = [hist[0][1], hist[1][1]]
        else
          # three of a kind
          @hand[:three_of_a_kind] = hist[0][1]
        end
      elsif hist[0][0] == 2
        # two of a kind
        if hist[1][0] == 2
          # two pair
          @hand[:two_pair] = [hist[0][1], hist[1][1]]
        else
          # one pair
          @hand[:one_pair] = hist[0][1]
        end
      else
        # now all that is left is flush, and a single card
        if same_suit?
          # flush!
          @hand[:flush] = @cards[0].suit
        else
          # single card
          @hand[:high_card] = @cards[-1].value_int
        end
      end
    end 
  end
  
  def inspect
    "Hand: id: #{@id}, #{@hand.inspect}"
  end
  
  def to_s
    @id
  end
  
  def hand
    @hand
  end
  
  def cards
    @cards
  end
  
  # returns 1 if self is higher, 0 on tie, -1 if other is higher
  def <=>(other)
    # since the default in the @hand Hash is false, we can just check for keys
    
    if @hand[:royal_flush]
      if @other.hand[:royal_flush]
        return 0
      else
        return 1
      end
    end
    
    if @hand[:straight_flush]
      # value here is the starting value
      if other.hand[:royal_flush]
        # the other is higher
        return -1
      elsif other.hand[:straight_flush]
        # need to check values
        return @hand[:straight_flush] <=> other.hand[:straight_flush]
      else
        return 1
      end
    end
    
    if @hand[:four_of_a_kind]
      if other.hand[:royal_flush] || other.hand[:straight_flush]
        return -1
      elsif other.hand[:four_of_a_kind]
        return @hand[:four_of_a_kind] <=> other.hand[:four_of_a_kind]
      else
        return 1
      end
    end
    
    if @hand[:full_house]
      if other.hand[:royal_flush] || 
        other.hand[:straight_flush] || 
        other.hand[:four_of_a_kind]
        return -1
      elsif other.hand[:full_house]
        # first element of value array is the number of the three-of-a-kind part
        return @hand[:full_house][0] <=> other.hand[:full_house][0]
      else
        return 1
      end
    end
    
    if @hand[:flush]
      if other.hand[:royal_flush] || 
        other.hand[:straight_flush] || 
        other.hand[:four_of_a_kind] || 
        other.hand[:full_house]
        return -1
      elsif other.hand[:flush]
        return compare_values(other)
      else
        return 1
      end
    end
    
    if @hand[:straight]
      if other.hand[:royal_flush] || 
        other.hand[:straight_flush] || 
        other.hand[:four_of_a_kind] || 
        other.hand[:full_house] ||
        other.hand[:flush]
        return -1
      elsif other.hand[:straight]
        # just check starting point
        return @cards[0] <=> other.cards[0]
      else
        return 1
      end
    end
    
    if @hand[:three_of_a_kind]
      if other.hand[:royal_flush] || 
        other.hand[:straight_flush] || 
        other.hand[:four_of_a_kind] || 
        other.hand[:full_house] ||
        other.hand[:flush] ||
        other.hand[:straight]
        return -1
      elsif other.hand[:three_of_a_kind]
        return @hand[:three_of_a_kind] <=> other.hand[:three_of_a_kind]
      else
        return 1
      end
    end
    
    if @hand[:two_pair]
      if other.hand[:royal_flush] || 
        other.hand[:straight_flush] || 
        other.hand[:four_of_a_kind] || 
        other.hand[:full_house] ||
        other.hand[:flush] ||
        other.hand[:straight] ||
        other.hand[:three_of_a_kind]
        return -1
      elsif other.hand[:two_pair]
        pairs_s = @hand[:two_pair].sort
        pairs_o = other.hand[:two_pair].sort
        
        # we need to test the higher, and then the lower if necessary
        if (pairs_s[1] <=> pairs_o[1]) == 0
          return pairs_s[0] <=> pairs_o[0]
        else
          return pairs_s[1] <=> pairs_o[1]
        end
      else
        return 1
      end
    end
    
    if @hand[:one_pair]
      if other.hand[:royal_flush] || 
        other.hand[:straight_flush] || 
        other.hand[:four_of_a_kind] || 
        other.hand[:full_house] ||
        other.hand[:flush] ||
        other.hand[:straight] ||
        other.hand[:three_of_a_kind] ||
        other.hand[:two_pair]
        return -1
      elsif other.hand[:one_pair]
        if @hand[:one_pair] == other.hand[:one_pair]
          # compare highest card
          return compare_values(other)
        else
          return @hand[:one_pair] <=> other.hand[:one_pair]
        end
      else
        return 1
      end
    end
    
    if @hand[:high_card]
      if other.hand[:royal_flush] || 
        other.hand[:straight_flush] || 
        other.hand[:four_of_a_kind] || 
        other.hand[:full_house] ||
        other.hand[:flush] ||
        other.hand[:straight] ||
        other.hand[:three_of_a_kind] ||
        other.hand[:two_pair] ||
        other.hand[:one_pair]
        return -1
      elsif other.hand[:high_card]
        return @hand[:high_card] <=> other.hand[:high_card]
      else
        return 1
      end
    end
    
    raise RuntimeError "WE SHOULD NOT EVER GET HERE: #{@hand.inspect}"
    
    1
  end
  
  private
  def compare_values(other)
    # compare the cards without regard to suit
    4.downto(0) do |i|
      if @cards[i] != other.cards[i]
        return @cards[i] <=> other.cards[i]
      end
    end
    
    # if we get here they are equal
    0
  end
  
  private
  def straight?
    start = @cards[0].value_int
    
    start+1 == @cards[1].value_int &&
      start+2 == @cards[2].value_int &&
      start+3 == @cards[3].value_int &&
      start+4 == @cards[4].value_int
  end
  
  private
  def same_suit?
    suit = @cards[0].suit
    @cards.each do |card|     
      return false if suit != card.suit
    end
    
    true
  end
  
  private
  def multiples
    hist = Hash.new(0)
    @cards.each do |card|
      hist[card.value_int] += 1
    end
    
    # flip the key/value pairs
    hist_arr = hist.to_a.map { |e| e[0], e[1] = e[1], e[0]; e }
    return hist_arr.sort { |a, b| 0-(a[0] <=> b[0]) }
    #return hist.to_a.sort { |a, b| a[0] <=> b[0] }
  end
end

class Card
  include Comparable
  
  attr_reader :value, :suit
  
  def initialize(card)
    @value = card[0]
    @suit = card[1]
  end
  
  def <=>(other)
    self.value_int <=> other.value_int
  end
   
  def value_int
    case @value
    when "T"  then 10
    when "J"  then 11
    when "Q"  then 12
    when "K"  then 13
    when "A"  then 14
    else @value.to_i
    end
  end
  
  def inspect
    "Card: (#{@value}, #{@suit})"
  end
end

def get_hands(line)
  cards = line.split(" ")
  
  hands = []
  cards.each { |card| hands << Card.new(card) }
  
  [Hand.new(1, hands[0, 5]), Hand.new(2, hands[5, 9])]
end



hands = File.open("poker.txt").readlines

#hands = [
#  "5H 5C 6S 7S KD 2C 3S 8S 8D TD",
#  "5D 8C 9S JS AC 2C 5C 7D 8S QH",
#  "2D 9C AS AH AC 3D 6D 7D TD QD",
#  "4D 6S 9H QH QC 3D 6D 7H QD QS",
#  "2H 2D 4C 4D 4S 3C 3D 3S 9S 9D"
#]

count = 0
hands.each do |line|
  hands = get_hands(line)
  
  #if player1_hand > player2_hand
  #  puts "player 1!!!"
  #end
  
  puts hands[0].hand
  puts hands[1].hand
  
  count += 1 if hands.sort[1].id == 1
end

puts "Player 1 wins #{count} times."


