use("ispec")
use("lib/rules")
use("lib/board")

describe("Rules",

  it("detects a horizontal win",
    board = Board mimic(3)
    board dimension times(column,
      board reset!
      Rules horizontal_winner?(board) should be false
      board set_space(column,0,1)
      board set_space(column,1,1)
      board set_space(column,2,1)
      Rules horizontal_winner?(board) should be true
    )
  )

  it("detects a vertical win",
    board = Board mimic(3)
    board dimension times(row,
      board reset!
      Rules vertical_winner?(board) should be false
      board set_space(0,row,-1)
      board set_space(1,row,-1)
      board set_space(2,row,-1)
      Rules vertical_winner?(board) should be true
    )
  )

  it("detects a back diagonal win",
    board = Board mimic(3)
    Rules diagonal_winner?(board) should be false
    board set_space(0,0,-1)
    board set_space(1,1,-1)
    board set_space(2,2,-1)
    Rules diagonal_winner?(board) should be true
  )

  it("detects a back diagonal win",
    board = Board mimic(3)
    Rules diagonal_winner?(board) should be false
    board set_space(2,0,-1)
    board set_space(1,1,-1)
    board set_space(0,2,-1)
    Rules diagonal_winner?(board) should be true
  )
)
