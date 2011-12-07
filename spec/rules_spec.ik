use("ispec")
use("lib/rules")
use("lib/board")

describe("Rules",

    before(board = Board mimic(3))

    it("detects a horizontal win",
      board dimension times(column,
        board reset!
        Rules winner?(board) should be false
        board set_space(column,0,1)
        board set_space(column,1,1)
        board set_space(column,2,1)
        Rules winner?(board) should be true
        Rules winner(board) should == 1
        )
      )

    it("detects a vertical win",
      board dimension times(row,
        board reset!
        Rules winner?(board) should be false
        board set_space(0,row,-1)
        board set_space(1,row,-1)
        board set_space(2,row,-1)
        Rules winner?(board) should be true
        Rules winner(board) should == -1
        )
      )

    it("detects a back diagonal win",
        Rules winner?(board) should be false
        board set_space(0,0,-1)
        board set_space(1,1,-1)
        board set_space(2,2,-1)
        Rules winner?(board) should be true
        Rules winner(board) should == -1
      )

    it("detects a back diagonal win",
        Rules winner?(board) should be false
        board set_space(2,0,-1)
        board set_space(1,1,-1)
        board set_space(0,2,-1)
        Rules winner?(board) should be true
        Rules winner(board) should == -1
      )

    it("detects a cat's game",
        Rules cats_game?(board) should be false
        board set_space(0,0,1)
        board set_space(0,1,1)
        board set_space(0,2,-1)
        board set_space(1,0,-1)
        board set_space(1,1,-1)
        board set_space(1,2,1)
        board set_space(2,0,1)
        board set_space(2,1,-1)
        board set_space(2,2,1)
        Rules cats_game?(board) should be true
        Rules winner(board) should == 0
      )

    it("detects a game over by cats game or a winner",
        Rules game_over?(board) should be false
        board set_space(0,0,1)
        board set_space(0,1,1)
        board set_space(0,2,-1)
        board set_space(1,0,-1)
        board set_space(1,1,-1)
        board set_space(1,2,1)
        board set_space(2,0,1)
        board set_space(2,1,-1)
        board set_space(2,2,1)
        Rules game_over?(board) should be true
        Rules winner(board) should == 0
        board reset!
        Rules game_over?(board) should be false
        board set_space(0,0,1)
        board set_space(0,1,1)
        board set_space(0,2,1)
        Rules game_over?(board) should be true
        Rules winner(board) should == 1
      )
    )
