Illustrator = Origin mimic

Illustrator draw = method(board,
    illustration = ""
    board spaces each(row,
      row each(space,
        illustration += "[" + space_marker(space) + "]")
      illustration += "\n")
    illustration)

Illustrator space_marker = method(space_value,
    cond(
      space_value == 1, "X",
      space_value == -1, "O",
      space_value == 0, " ",
      "?"))
