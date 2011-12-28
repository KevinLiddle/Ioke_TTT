use("lib/board")
use("lib/illustrator")
use("lib/rules")
use("lib/human_player")
use("lib/machine_player")

Game = Origin mimic

Game initialize = method(game_type, illustrator,
    self board = Board mimic(3)
    self illustrator = illustrator
    self player1 = nil
    self player2 = nil
    cond(
      game_type == "1", human_vs_human,
      game_type == "2", machine_vs_human,
      game_type == "3", human_vs_machine,
      human_vs_human
      )
    )

Game human_vs_human = method(
    self player1 = HumanPlayer mimic(1)
    self player2 = HumanPlayer mimic(-1)
    )

Game machine_vs_human = method(
    self player1 = MachinePlayer mimic(1)
    self player2 = HumanPlayer mimic(-1)
    )

Game human_vs_machine = method(
    self player1 = HumanPlayer mimic(1)
    self player2 = MachinePlayer mimic(-1)
    )

Game play = method(
    until(Rules game_over?(board),
      take_turn
      )
    self illustrator display_board(self board)
    self illustrator print_game_over_message(self board)
    )

Game take_turn = method(
    self illustrator display_board(self board)
    move = player_by_turn get_move(self board)
    make_move(move[0], move[1])
    )

Game player_by_turn = method(
    total_moves = board spaces flatten remove!(0) length
    if(total_moves % 2 == 0,
      player1,
      player2)
    )

Game make_move = method(row, column,
    if(self board get_space(row, column) == 0,
      self board set_space(row, column, player_by_turn marker_value))
    )
