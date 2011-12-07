use("lib/board")

MachinePlayer = Origin mimic

MachinePlayer initialize = method(marker_value,
    self marker_value = marker_value
    )

MachinePlayer get_move = method(board,
    if(board get_space(middle_of_board(board), middle_of_board(board)) == 0,
      [middle_of_board(board), middle_of_board(board)],
      minimax(board, marker_value, 1) keys first
      )
    )
; DOES NOT WORK YET. need to compare weights based on player value
MachinePlayer minimax = method(board, turn, depth,
    best_move = {}
    board dimension times(row,
      board dimension times(column,
        if(board get_space(row, column) == 0,
          board set_space(row, column, turn)
          if(Rules game_over?(board),
            if(best_move == {} or better_than_best?(inverse(Rules winner(board) * (depth + 1)), best_move[best_move keys first]),
              best_move = { [row, column] => inverse( Rules winner(board) * (depth + 1) ) }
              )
            ,
            next_level_best_move = minimax(board, turn negation, depth + 1)
            next_move = { [row, column] => next_level_best_move[next_level_best_move keys first] }
            if( best_move == {} or better_than_best?(next_move[next_move keys first], best_move[best_move keys first]),
              best_move = next_move
              )
            )
          board set_space(row, column, 0)
          )
        )
      )
    best_move
    )

MachinePlayer better_than_best? = method(score, best_move_score,
    if(marker_value > 0,
      score > best_move_score,
      score < best_move_score
      )
    )

MachinePlayer middle_of_board = method(board,
    (board dimension - (board dimension % 2)) / 2 ; Ioke doesn't have Integer divsion or rounding. performing (3/2) will yield a "Ratio" of 3/2, which you can't do much with
    )

MachinePlayer inverse = method(value,
    if(value != 0,
      1 / value,
      0
      )
    )
