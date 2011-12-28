use("ispec")
use("lib/game")

describe("Game",

    before(game = Game mimic("1", Illustrator mimic))

    it("initializes a game with a board",
      game board should not be nil
      )

    it("initializes a human vs. human game with game type 1",
      game player1 kind should == "HumanPlayer"
      )

    it("draws the board when game is started",
      game illustrator should receive display_board(game board)
      game player1 should receive get_move(game board) andReturn([2,1])
      game take_turn
      )

    it("knows whose turn it is",
      game player_by_turn should == game player1
      game board set_space(0,0,1)
      game player_by_turn should == game player2
      )

    it("makes a move",
      game make_move(2, 1)
      game board get_space(2, 1) should == 1
      )

    it("creates 2 human players for game type 1",
      game player1 kind should == "HumanPlayer"
      game player2 kind should == "HumanPlayer"
      )

    it("creates 1 machine player and 1 human player for game type 2",
      game1 = Game mimic("2", Illustrator mimic)
      game1 player1 kind should == "MachinePlayer"
      game1 player2 kind should == "HumanPlayer"
      )

    it("creates 1 human player and 1 machine player for game type 3",
      game2 = Game mimic("3", Illustrator mimic)
      game2 player1 kind should == "HumanPlayer"
      game2 player2 kind should == "MachinePlayer"
      )

    it("prints the board and the game over message when the game is done",
      game board set_space(0,0,1)
      game board set_space(0,1,1)
      game board set_space(0,2,1)
      game board set_space(1,0,-1)
      game board set_space(2,0,-1)

      game illustrator should receive display_board(game board)
      game illustrator should receive print_game_over_message(game board)

      game play
      )
    )
