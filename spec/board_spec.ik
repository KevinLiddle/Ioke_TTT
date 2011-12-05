use("ispec")
use("lib/board")

describe("Board",

  it("can be initialized",
    board = Board mimic(3)
    board dimension should == 3
  )

  it("initializes board with values of 0",
    board = Board mimic(3)
    3 times(row,
      3 times(column,
        board get_space(row, column) should == 0))
  )

  it("can set board spaces",
    board = Board mimic(3)
    board get_space(0,0) should == 0
    board set_space(0,0,1)
    board get_space(0,0) should == 1
    board get_space(1,0) should == 0
  )

  it("resets the board",
    board = Board mimic(3)
    board blank? should be true
    board set_space(0,0,1)
    board blank? should be false
    board reset!
    board blank? should be true
  )

  it("grabs a given row",
    board = Board mimic(3)
    board set_space(0,0,1)
    board set_space(0,1,-1)
    board get_row(0) should == [1, -1, 0]
    )

  it("grabs a given column",
    board = Board mimic(3)
    board set_space(0,0,1)
    board set_space(1,0,-1)
    board get_column(0) should == [1, -1, 0]
    )

  it("grabs a back diagonal",
    board = Board mimic(3)
    board set_space(0,0,1)
    board set_space(1,1,-1)
    board get_back_diagonal should == [1, -1, 0]
    )

  it("grabs a forward diagonal",
    board = Board mimic(3)
    board set_space(0,2,1)
    board set_space(1,1,-1)
    board set_space(2,0,-1)
    board get_back_diagonal should == [0, -1, 0]
    board get_forward_diagonal should == [-1, -1, 1]
    )
)
