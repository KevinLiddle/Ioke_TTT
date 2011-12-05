Rules = Origin mimic

Rules horizontal_winner? = method(board,
                                      winning_row? = false
                                      board dimension times(row_index,
                                        row = board get_row(row_index)
                                        if(winning_group?(board dimension, row),
                                          winning_row? = true))
                                      winning_row?)

Rules vertical_winner? = method(board,
                                    winning_column? = false
                                    board dimension times(column_index,
                                      column = board get_column(column_index)
                                      if(winning_group?(board dimension, column),
                                        winning_column? = true))
                                    winning_column?)

Rules diagonal_winner? = method(board,
                                    back_diagonal_winner?(board) or forward_diagonal_winner?(board))

Rules back_diagonal_winner? = method(board,
                                         winning_group?(board dimension, board get_back_diagonal))

Rules forward_diagonal_winner? = method(board,
                                         winning_group?(board dimension, board get_forward_diagonal))

Rules winning_group? = method(board_dimension, group,
                                  group select(n, n == group first and n != 0) length == board_dimension)
