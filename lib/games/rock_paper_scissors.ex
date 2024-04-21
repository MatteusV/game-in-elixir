defmodule Games.RockPaperScissors do
    @moduledoc """
    para de dar error!
  """
  @spec play :: atom()
  def play do
    user_choice = "(rock/paper/scissors): " |> IO.gets() |> String.trim()
    ai_choice = Enum.random(["rock", "paper", "scissors"])

    case determine_winner(user_choice, ai_choice) do
      :win -> IO.puts("You win! #{user_choice} beats #{ai_choice}.")
      :lose -> IO.puts("You lose! #{ai_choice} beats #{user_choice}.")
      :tie -> IO.puts("It's a tie!")
    end
  end

  @spec determine_winner(String.t(), String.t()) :: atom()
  defp determine_winner(user_choice, ai_choice) when user_choice == ai_choice, do: :tie
  defp determine_winner("paper", "rock"), do: :win
  defp determine_winner("rock", "scissors"), do: :win
  defp determine_winner("scissors", "paper"), do: :win
  defp determine_winner(_user_choice, _ai_choice), do: :lose
end
