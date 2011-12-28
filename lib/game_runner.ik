use("lib/game")
use("lib/illustrator")

GameRunner = Origin mimic

GameRunner get_game_type = method(
    prompt_for_game_type
    game_type = System in read asText
    if(game_type == "0",
      System exit,
      Game mimic(game_type, Illustrator mimic)
      )
    )

GameRunner prompt_for_game_type = method(
    "Please choose a game type.\n1 (Default): Human vs. Human\n2: Machine vs. Human\n3: Human vs. Machine\n0: Quit\nYour Choice: " print
    )
