require './pawn.rb'
require './king.rb'
require './queen.rb'
require './bishop.rb'
require './rook.rb'
require './knight.rb'
require './game'
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) }
    @white_pawns = []
    for i in 1..8
      @white_pawns << Pawn.new('White', [1, i])
    end

    @black_pawns = []
    for i in 1..8
      @black_pawns << Pawn.new('Black', [6, i])
    end
    @white_king = King.new('White', [0, 5])
    @black_king = King.new('Black', [7, 5])

    @white_queen = Queen.new('White', [0, 4])
    @black_queen = Queen.new('Black', [7, 4])

    @white_knight1 = Knight.new('White', [0, 2])
    @white_knight2 = Knight.new('White', [0, 7])
    
    @black_knight1 = Knight.new('Black', [7, 2])
    @black_knight2 = Knight.new('Black', [7, 7])
    
    @white_rook1 = Rook.new('White', [0, 1])
    @white_rook2 = Rook.new('White', [0, 8])
    
    @black_rook1 = Rook.new('White', [7, 1])
    @black_rook2 = Rook.new('White', [7, 8])
    
    @white_bishop1 = Bishop.new('White', [0, 3])
    @white_bishop2 = Bishop.new('White', [0, 6])
    
    @black_bishop1 = Bishop.new('Black', [7, 3])
    @black_bishop2 = Bishop.new('Black', [7, 6])
    
    # place the pawns with a loop
    @black_pawns.each_with_index do |pawn, _index|
      grid[pawn.position[0]][pawn.position[1]] = pawn
    end
    @white_pawns.each_with_index do |pawn, index|
      grid[1][index + 1] = pawn
      end
    @white_score = 0
    @black_score = 0
    setup_board
  end

  def setup_board
    
    
    # rooks
    grid[@white_rook1.position[0]][@white_rook1.position[1]] = @white_rook1
    grid[@white_rook2.position[0]][@white_rook2.position[1]] = @white_rook2
    
    grid[@black_rook1.position[0]][@black_rook1.position[1]] = @black_rook1
    grid[@black_rook2.position[0]][@black_rook2.position[1]] = @black_rook2
    
    # knights
    grid[@white_knight1.position[0]][@white_knight1.position[1]] = @white_knight1
    grid[@white_knight2.position[0]][@white_knight2.position[1]] = @white_knight2
    
    grid[@black_knight1.position[0]][@black_knight1.position[1]] = @black_knight1
    grid[@black_knight2.position[0]][@black_knight2.position[1]] = @black_knight2
    
    # bishops
    grid[@white_bishop1.position[0]][@white_bishop1.position[1]] = @white_bishop1
    grid[@white_bishop2.position[0]][@white_bishop2.position[1]] = @white_bishop2
    
    grid[@black_bishop1.position[0]][@black_bishop1.position[1]] = @black_bishop1
    grid[@black_bishop2.position[0]][@black_bishop2.position[1]] = @black_bishop2
    
    # queens
    grid[@white_queen.position[0]][@white_queen.position[1]] = @white_queen
    grid[@black_queen.position[0]][@black_queen.position[1]] = @black_queen
    
    # kings
    grid[@white_king.position[0]][@white_king.position[1]] = @white_king
    grid[@black_king.position[0]][@black_king.position[1]] = @black_king

    #labels 
    
    grid[0][0] = '1'
    grid[1][0] = '2'
    grid[2][0] = '3'
    grid[3][0] = '4'
    grid[4][0] = '5'
    grid[5][0] = '6'
    grid[6][0] = '7'
    grid[7][0] = '8'
    grid[8] = [' ', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
  
  end

  def move_piece(from_position, to_position, current_player)
    from_x =  0
    from_y =  0
    to_x = 0
    to_y = 0
    
    grid.each_with_index do |i, index1|
      i.each_with_index do |j,index2|
        if j == from_position[0].to_s
          from_x = index1
        elsif j == from_position[1].to_s
          from_y = index2
        end
        if j == to_position[0].to_s
            to_x = index1
        elsif j == to_position[1].to_s
            to_y = index2
        end
      end
    end
  
    piece = grid[from_x][from_y]
    from_position = [from_x,from_y]
    to_position = [to_x,to_y]
    
    print 'Was that a valid move? (be honest) y/n  '
    valid = gets
    if valid.downcase == 'n'
      return false 
    end
    if grid[to_x][to_y].nil?
      # if
      #   current_player_score += 1
      #   puts current_player_score
      # end
      # Move the piece to the 'to' position
      grid[to_x][to_y] = piece
      grid[from_x][from_y] = nil
      piece.position = to_position
     
      setup_board
      return true
    elsif grid[to_x][to_y].color != current_player.color
       grid[to_x][to_y] = piece
      grid[from_x][from_y] = nil
      piece.position = to_position
      if current_player.color == :white 
        @white_score += 1 
      else 
        @black_score += 1
      end
      return true
    end

  end


  def display
      for i in 0..8
      for j in 0..8
        piece = grid[i][j]
        if piece.class != NilClass 
          if piece.class == String
            print piece 
          else 
            print piece.unicode
          end
         
        else 
          print piece 
        end 
        print ' '
      end 
      puts ' '
    end
    print 'White Score: '
    puts @white_score
    print 'Blcack score: '
    puts @black_score
  end

  def checkmate?(color)
    # Check if a player of the given color is in checkmate.
  end
end

