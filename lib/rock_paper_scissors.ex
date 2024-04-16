defmodule Games.RockPaperScissors do
  def play do
    user_choice = get_user_choice()
    ai_choice = generate_ia_choice()

    case determine_winner(user_choice, ai_choice) do
      :win -> IO.puts("You win! #{user_choice} beats #{ai_choice}.")
      :lose -> IO.puts("You lose! #{ai_choice} beats #{user_choice}.")
      :tie -> IO.puts("It's a tie!")
    end
  end


  defp generate_ia_choice do
    Enum.random(["rock", "paper", "scissors"])
  end

  defp get_user_choice do
    IO.puts("(rock/paper/scissors): ")
    IO.gets("") |> String.trim()
  end

  defp determine_winner(user_choice, ai_choice) do
    case {user_choice, ai_choice} do
      {"rock", "scissors"} -> :win
      {"paper", "rock"} -> :win
      {"scissors", "paper"} -> :win
      {_, _} when user_choice == ai_choice -> :tie
      _ -> :lose
    end
  end
end
