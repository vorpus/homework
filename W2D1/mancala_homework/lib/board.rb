class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      cup.concat(Array.new(4) {:stone}) unless idx == 6 || idx == 13
    end
  end

  def valid_move?(start_pos)
    if start_pos < 1
      raise "Invalid starting cup"
    elsif start_pos > 14
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stone_to_move = @cups[start_pos]
    @cups[start_pos] = []
    cup_to_drop_stone = start_pos
    until stone_to_move.empty?
      cup_to_drop_stone += 1
      cup_to_drop_stone = 0 if cup_to_drop_stone > 13
      if cup_to_drop_stone == 6
        @cups[6] << stone_to_move.pop if current_player_name == @name1
      elsif cup_to_drop_stone == 13
        @cups[13] << stone_to_move.pop if current_player_name == @name2
      else
        @cups[cup_to_drop_stone] << stone_to_move.pop
      end


    end
    render
    next_turn(cup_to_drop_stone)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups.take(6).all?{|cup| cup.empty?} || @cups[7..12].all?{|cup| cup.empty?}
  end

  def winner
    case @cups[6] <=> @cups[13]
    when -1
      @name2
    when 0
      :draw
    when 1
      @name1
    end
  end
end
