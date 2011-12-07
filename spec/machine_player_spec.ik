use("ispec")
use("lib/machine_player")

describe("MachinePlayer",

    before(
      player = MachinePlayer mimic(1)
      board = Board mimic(3)
      )

    it("can be initialized with a marker value",
      player marker_value should == 1
      )

    it("calculates the inverse of a number",
      MachinePlayer inverse(4) should == 1/4
      MachinePlayer inverse(-4) should == -1/4
      MachinePlayer inverse(0) should == 0
      )

    it("compares scores based on the player's marker value",
      player better_than_best?(1/3, -1/8) should be true
      MachinePlayer mimic(-1) better_than_best?(1/3, -1/8) should be false
      )

    it("returns the index of the middle of the board",
      MachinePlayer middle_of_board(board) should == 1
      MachinePlayer middle_of_board(Board mimic(10)) should == 5
      MachinePlayer middle_of_board(Board mimic(17)) should == 8
      )

   ; it("will pick the middle if available",
   ;   player get_move(board) should == [1,1]
   ;   )

   ; it("will win if it can",
   ;   board set_space(0,0,1)
   ;   board set_space(0,1,-1)
   ;   board set_space(1,1,1)
   ;   board set_space(0,2,-1)
   ;   player get_move(board) should == [2,2]
   ;   )

    it("blocks when it should",
      board set_space(0,0,-1)
      board set_space(1,1,1)
      board set_space(1,0,-1)
      player get_move(board) should == [2,0]
      )

   ; it("*********************",
   ;   board set_space(0,0,-1)
   ;   board set_space(1,1,1)
   ;   board set_space(1,0,-1)
   ;   player get_move(board) should == [2,0]
   ;   )

   ; it("wins an easy one",
   ;   board set_space(0,0,-1)
   ;   board set_space(0,1,1)
   ;   board set_space(0,2,-1)
   ;   board set_space(1,0,-1)
   ;   board set_space(1,1,1)
   ;   board set_space(1,2,-1)
   ;   board set_space(2,0,1)
   ;   player get_move(board) should == [2,1]
   ;   )

   ; it("blocks an easy one",
   ;   board set_space(0,0,1)
   ;   board set_space(0,1,-1)
   ;   board set_space(0,2,1)
   ;   board set_space(1,0,-1)
   ;   board set_space(1,1,-1)
   ;   board set_space(2,0,-1)
   ;   board set_space(2,1,1)
   ;   player get_move(board) should == [1,2]
   ;   )
    )
