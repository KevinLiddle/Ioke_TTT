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

    it("gets the first value of a dict",
      move = {[2,1] => 1/5}
      MachinePlayer get_score(move) should == 1/5
      )

    it("compares scores based on the player's marker value",
      MachinePlayer better_than_best?(1/3, {[2,1] => -1/8}, 1) should be true
      MachinePlayer better_than_best?(1/3, {[2,1] => -1/8}, -1) should be false
      )

    it("will pick the middle if available",
      player get_move(board) should == [1,1]
      )

    it("will win if it can",
      board set_space(0,0,1)
      board set_space(0,1,-1)
      board set_space(1,1,1)
      board set_space(0,2,-1)
      player get_move(board) should == [2,2]
      )

    it("blocks when it should",
      board set_space(0,0,-1)
      board set_space(1,1,1)
      board set_space(1,0,-1)
      player get_move(board) should == [2,0]
      )

    it("wins an easy one",
      board set_space(0,0,-1)
      board set_space(0,1,1)
      board set_space(0,2,-1)
      board set_space(1,0,-1)
      board set_space(1,1,1)
      board set_space(1,2,-1)
      board set_space(2,0,1)
      player get_move(board) should == [2,1]
      )

    it("blocks an easy one",
      board set_space(0,0,1)
      board set_space(0,1,-1)
      board set_space(0,2,1)
      board set_space(1,0,-1)
      board set_space(1,1,-1)
      board set_space(2,0,-1)
      board set_space(2,1,1)
      player get_move(board) should == [1,2]
      )
    )
