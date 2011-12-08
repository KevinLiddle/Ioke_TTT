use("ispec")
use("lib/game_runner")

describe("GameRunner",

    it("prompts the user for a game type",
      GameRunner should receive prompt_for_game_type
      System in should receive read andReturn("3")
      game = GameRunner get_game_type
      game kind should == "Game"
      game player1 kind should == "HumanPlayer"
      game player2 kind should == "MachinePlayer"
      )

    it("defaults to Human vs Human if there is bad input",
      GameRunner should receive prompt_for_game_type
      System in should receive read andReturn("x")
      game = GameRunner get_game_type
      game kind should == "Game"
      game player1 kind should == "HumanPlayer"
      game player2 kind should == "HumanPlayer"
      )
    )
