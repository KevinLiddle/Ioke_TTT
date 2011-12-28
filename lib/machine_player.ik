use("lib/board")
use("lib/rules")

MachinePlayer = Origin mimic

MachinePlayer initialize = method(marker_value,
    self marker_value = marker_value
    )

MachinePlayer get_move = method(board,
    if(board blank? or other_player_took_middle(board),
      board corners random,
      move = block_or_win(board)
      if(move == [],
        move = if(first_move_as_player_2?(board),
          [board middle_index, board middle_index],
          minimax(board, marker_value, 1) keys first
          )
        )
      move
      )
    )

MachinePlayer minimax = method(board, turn, depth,

    best_move = {}
    winning_move = game_saving_move(board, turn)

    if(winning_move != [],
      best_move = {winning_move => inverse(turn * depth)}
      )

    if(best_move == {},
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
      )
      best_move
    )

MachinePlayer first_move_as_player_2? = method(board,
    board number_of_moves == 1
    )

MachinePlayer other_player_took_middle = method(board,
    board number_of_moves == 1 and board empty_at?(board middle_index, board middle_index) not
    )

MachinePlayer block_or_win = method(board,
    best_move = immediate_winning_move(board)
    if(best_move == [],
      best_move = immediate_blocking_move(board)
      )
    best_move
    )

MachinePlayer game_saving_move = method(board, turn,
    saving_move = []
    upcoming_winner = turn * (board dimension - 1)
    board dimension times(group_index,
      if(board get_row(group_index) reduce(+) == upcoming_winner,
        saving_move = [group_index, board get_row(group_index) index(0)]
        )
      if(board get_column(group_index) reduce(+) == upcoming_winner,
        saving_move = [board get_column(group_index) index(0), group_index]
        )
      )
    if(board get_back_diagonal reduce(+) == upcoming_winner,
      saving_move = [board get_back_diagonal index(0), board get_back_diagonal index(0)]
      )
    if(board get_forward_diagonal reduce(+) == upcoming_winner,
      saving_move = [board dimension - board get_forward_diagonal index(0) - 1, board get_forward_diagonal index(0)]
      )
    saving_move
    )

MachinePlayer immediate_winning_move = method(board,
    game_saving_move(board, marker_value)
    )

MachinePlayer immediate_blocking_move = method(board,
    game_saving_move(board, marker_value * -1)
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
