Board = Origin mimic

Board initialize = method(dimension,
    self dimension = dimension
    self spaces = self initialize_spaces)

Board initialize_spaces = method(
    row = []
    board_spaces = []
    self dimension times(row << 0)
    self dimension times(board_spaces << row mimic)
    board_spaces
    )

Board get_space = method(row, column,
    self spaces[row][column])

Board set_space = method(row, column, player_value,
    self spaces[row][column] = player_value
    )

Board blank? = method(
    blank = true
    dimension times(row,
      dimension times(column,
        unless(get_space(row, column) == 0,
          blank = false)))
    blank)

Board full? = method(
    full = true
    dimension times(row,
      dimension times(column,
        if(get_space(row, column) == 0,
          full = false)))
    full)

Board reset! = method(
    self spaces = initialize_spaces)

Board get_row = method(row_index,
    self spaces[row_index])

Board get_column = method(column_index,
    column = []
    self dimension times(row_index,
      column << get_space(row_index, column_index))
    column)

Board get_back_diagonal = method(
    diagonal = []
    self dimension times(index,
      diagonal << get_space(index, index))
    diagonal)

Board get_forward_diagonal = method(
    diagonal = []
    self dimension times(index,
      diagonal << get_space(self dimension - 1 - index, index))
    diagonal)

Board middle_index = method(
    (dimension - (dimension % 2)) / 2 ; Ioke doesn't have Integer divsion or rounding. performing (3/2) will yield a "Ratio" of 3/2, which you can't do much with
    )
