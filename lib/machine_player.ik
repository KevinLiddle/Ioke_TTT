use("lib/board")

MachinePlayer = Origin mimic

MachinePlayer initialize = method(marker_value,
    self marker_value = marker_value
    )

MachinePlayer get_move = method(board,
    if(board get_space(board middle_index, board middle_index) == 0,
      [ board middle_index, board middle_index ],
      minimax(board, marker_value, 1) keys first
      )
    )

MachinePlayer minimax = method(board, turn, depth,
    best_move = {}
    board dimension times(row,
      board dimension times(column,
        if(board get_space(row, column) == 0,
          board set_space(row, column, turn)
          if(Rules game_over?(board),
            if( better_than_best?(inverse(Rules winner(board) * (depth + 1)), best_move, turn),
              best_move = { [row, column] => inverse( Rules winner(board) * (depth + 1) ) }
              )
            ,
            next_level_best_move = minimax(board, turn negation, depth + 1)
            next_move = { [row, column] => get_score(next_level_best_move) }
            if( better_than_best?( get_score(next_move), best_move, turn ),
              best_move = next_move
              )
            )
          board set_space(row, column, 0)
          )
        )
      )
    best_move
    )

MachinePlayer better_than_best? = method(score, best_move, turn,
    best_move == {} or if(turn > 0,
      score > get_score(best_move),
      score < get_score(best_move)
      )
    )

MachinePlayer inverse = method(value,
    if(value != 0,
      1 / value,
      0
      )
    )

MachinePlayer get_score = method(move,
    move[move keys first]
    )
