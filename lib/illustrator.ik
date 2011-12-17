Illustrator = Origin mimic

Illustrator draw = method(board,
    illustration = ""
    board spaces each(row,
      row each(space,
        illustration += "[" + space_marker(space) + "]")
      illustration += "\n")
    illustration += "\n")

Illustrator space_marker = method(space_value,
    cond(
      space_value == 1, "X",
      space_value == -1, "O",
      space_value == 0, " ",
      "?"))

Illustrator game_over_message = method(board,
    cond(
      Rules winner(board) == 1, "Player 1 wins!",
      Rules winner(board) == -1, "Player 2 wins!",
      Rules winner(board) == 0, "Cat's Game..."
      )
    )
