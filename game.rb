
require './board.rb'

class Game
  attr_reader :board, :players, :current_player

  def initialize(player1, player2)
    @players = [player1, player2]
    @board = Board.new
    @current_player = player1
  end

  def switch_players
    @current_player = @current_player == players[0] ? players[1] : players[0]
  end

  def make_move_input(player)
    loop do
      puts "#{player.name}'s turn (#{player.color}): Enter your move (e.g., 'b2 to c3' or 'quit' to exit):"
      input = gets.chomp.downcase

      if input == 'quit'
        return 'quit'
      end

      unless input.match?(/^[a-h][1-8] to [a-h][1-8]$/)
        puts "Invalid input format. Please use the format 'from to' (e.g., 'b2 to c3')."
        next
      end

      from, to = input.split(' to ')

      from_column, from_row = from[0], from[1].to_i
      to_column, to_row = to[0], to[1].to_i
      
    
      from_position = [from_row,from_column]
      to_position = [to_row,to_column]
      return { from: from_position, to: to_position }
    end
  end


  def play
    loop do
      board.display
      move = make_move_input(current_player)

      if move == 'quit'
        puts "#{current_player.name} quits. Game over."
        break
      end

      valid_move = board.move_piece(move[:from], move[:to], current_player)

      unless valid_move
        puts 'Invalid move. Try again.'
        next
      end
      switch_players

      if board.checkmate?(current_player.color)
        board.display
        puts "Checkmate! #{current_player.name} wins!"
        break
      end
    end
  end
end


