defmodule Games.GameSelector do
  @moduledoc """
    asgfafa
  """
  def start() do
    loop()
  end

  def loop do
    IO.puts("What game would you like to play?")
    IO.puts("1. Guessing Game")
    IO.puts("2. Rock Paper Scissors")
    IO.puts("3. Wordle")
    IO.puts("Enter 'stop' to exit")

    case IO.gets(">> ") |> String.trim() do
      "1" -> Games.GuessingGame.play()
      "2" -> Games.RockPaperScissors.play()
      "3" -> Games.Wordle.play()
      "stop" -> :ok
      _ ->
        IO.puts("Invalid choice. Please select a valid option.")
        loop()
    end
  end
end
