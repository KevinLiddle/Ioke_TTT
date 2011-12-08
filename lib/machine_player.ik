use("lib/board")

MachinePlayer = Origin mimic

MachinePlayer initialize = method(marker_value,
    self marker_value = marker_value
    )

MachinePlayer get_move = method(board,
    if(board empty_at?(board middle_index, board middle_index),
      [ board middle_index, board middle_index ],
      minimax(board, marker_value, 1) keys first
      )
    )

MachinePlayer minimax = method(board, turn, depth,

    best_move = {}

    board dimension times(row,
      board dimension times(column,

        if(board empty_at?(row, column),

          board set_space(row, column, turn)
          if(Rules game_over?(board),
            if( better_move_than_best_move?(move_score(board, depth + 1), best_move, turn),
              best_move = { [row, column] => move_score(board, depth + 1 ) }
              ),
            ;else
            next_level_best_move = minimax(board, turn negation, depth + 1)
            next_move = { [row, column] => get_score(next_level_best_move) }
            if( better_move_than_best_move?( get_score(next_move), best_move, turn ),
              best_move = next_move
              )
            )

          board reset_space(row, column)
          )
        )
      ) ;end of iteration
    best_move
    )

MachinePlayer move_score = method(board, depth,
    inverse(Rules winner(board) * depth)
    )

MachinePlayer better_move_than_best_move? = method(score, best_move, turn,
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
