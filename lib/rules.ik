Rules = Origin mimic

Rules winner_of_group = method(board_dimension, group,
    common_group = group select(n, n == group first and n != 0)
    if(common_group length == board_dimension,
      common_group first,
      0
      ))

Rules horizontal_winner = method(board,
    winning_marker = 0
    board dimension times(row_index,
      row = board get_row(row_index)
      if(winner_of_group(board dimension, row) != 0,
        winning_marker = winner_of_group(board dimension, row)))
    winning_marker)

Rules vertical_winner = method(board,
    winning_marker = 0
    board dimension times(column_index,
      column = board get_column(column_index)
      if(winner_of_group(board dimension, column) != 0,
        winning_marker = winner_of_group(board dimension, column)))
    winning_marker)

Rules diagonal_winner = method(board,
    back_diagonal_winner(board) | forward_diagonal_winner(board))

Rules back_diagonal_winner = method(board,
    winner_of_group(board dimension, board get_back_diagonal))

Rules forward_diagonal_winner = method(board,
    winner_of_group(board dimension, board get_forward_diagonal))

Rules winner = method(board,
    horizontal_winner(board) | vertical_winner(board) | diagonal_winner(board))

Rules winner? = method(board,
    winner(board) != 0)

Rules cats_game? = method(board,
    board full? and winner?(board) not)

Rules game_over? = method(board,
    cats_game?(board) or winner?(board))
