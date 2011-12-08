use("lib/game")

GameRunner = Origin mimic

GameRunner get_game_type = method(
    prompt_for_game_type
    game_type = System in read asText
    Game mimic(game_type)
    )

GameRunner prompt_for_game_type = method(
    "Please choose a game type.\n1: Human vs. Human\n2: Machine vs. Human\n3: Human vs. Machine\nYour Choice: " print
    )
