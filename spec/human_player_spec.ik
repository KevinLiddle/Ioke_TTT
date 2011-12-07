use("ispec")
use("lib/human_player")

describe("HumanPlayer",

    before(
      player = HumanPlayer mimic(1)
      board = Board mimic(3)
      )

    it("can be initialized with a marker value",
      player marker_value should == 1
      )

    it("gets input from user for a move",
      player should receive prompt_for_move("row", board)
      player should receive prompt_for_move("column", board)
      System in should receive read andReturn("2") twice
      player get_move(board) should == [1, 1]
      )

    it("knows what moves are valid",
      player valid_input?(2, board) should be true
      player valid_input?(1, board) should be true
      player valid_input?(0, board) should be true
      player valid_input?(3, board) should be false
      player valid_input?(-1, board) should be false
      )
    )
