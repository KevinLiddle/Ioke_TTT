HumanPlayer = Origin mimic

HumanPlayer initialize = method(marker_value,
    self marker_value = marker_value)

HumanPlayer get_move = method(board,
    move = []
    ["row", "column"] each(position,
      input = -1
      until(valid_input?(input, board),
        prompt_for_move(position, board)
        bind(
          rescue(fn(c, "Please enter a real number...jerk." println)),
          input = parse_move_input
          )
        move << input
        )
      )
    move
    )

HumanPlayer parse_move_input = method(
    System in read asText toRational - 1
    )

HumanPlayer prompt_for_move = method(position, board,
    "Enter a #{position} (1-#{board dimension}): " print
    )

HumanPlayer valid_input? = method(input, board,
    input >= 0 and input < board dimension)
