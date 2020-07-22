module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2], #top row
      [3,4,5], #middle row
      [6,7,8], #bottom row
      [0,3,6], #left column
      [1,4,7], #middle column
      [2,5,8], #right column
      [0,4,8], #diagonal 1
      [2,4,6], # diagonal 2
      ]

    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      corner_moves = ["1", "3", "7", "9"]
      if for_the_win(board)
          (for_the_win(board)+1).to_s
      elsif two_of_three(board)
      (two_of_three(board)+1).to_s
      elsif !board.taken?(5)
        "5"
      elsif corner_moves.find{|p| board.cells[p.to_i-1] == " "}
        corner_moves.find{|p| board.cells[p.to_i-1] == " "}
      else
        valid_moves.sample
      end
    end


    def two_of_three(board)
       WIN_COMBINATIONS.find do |combo|
         #binding.pry
       if (board.taken?(combo[0]+1) && (board.cells[combo[0]] == board.cells[combo[1]]) && board.cells[combo[2]]== " ") then combo[2]
       elsif (board.taken?(combo[1]+1) && (board.cells[combo[1]] == board.cells[combo[2]]) && board.cells[combo[0]]== " ") then combo[0]
       elsif (board.taken?(combo[0]+1) && (board.cells[combo[0]] == board.cells[combo[2]]) && board.cells[combo[1]]== " ") then combo[1]
       else
        end
       end
     end



     def for_the_win(board)
        WIN_COMBINATIONS.find do |combo|
          #binding.pry
        if (board.cells[combo[0]] == self.token && board.cells[combo[1]] == self.token) && board.cells[combo[2]]== " " then combo[2]
        elsif (board.cells[combo[1]] == self.token && board.cells[combo[2]] == self.token) && board.cells[combo[0]]== " " then combo[0]
        elsif (board.cells[combo[0]] == self.token && board.cells[combo[2]] == self.token) && board.cells[combo[1]]== " " then combo[1]
         end
        end
      end






  end
end
