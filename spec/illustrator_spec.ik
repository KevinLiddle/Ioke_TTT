use("ispec")
use("lib/illustrator")

describe("Illustrator",

    before(board = Board mimic(3))

    it("can draw a blank board",
      Illustrator draw(board) should == "[ ][ ][ ]\n[ ][ ][ ]\n[ ][ ][ ]\n"
      )

    it("draws an X for player value 1",
      board set_space(0,0,1)
      Illustrator draw(board) should == "[X][ ][ ]\n[ ][ ][ ]\n[ ][ ][ ]\n"
      )

    it("draws an O for player value -1",
      board set_space(0,0,-1)
      Illustrator draw(board) should == "[O][ ][ ]\n[ ][ ][ ]\n[ ][ ][ ]\n"
      )

    it("draws a partially filled in board",
      board set_space(0,0,-1)
      board set_space(1,0,1)
      board set_space(2,1,-1)
      board set_space(2,2,1)
      board set_space(0,1,-1)
      Illustrator draw(board) should == "[O][O][ ]\n[X][ ][ ]\n[ ][O][X]\n"
      )

    )
