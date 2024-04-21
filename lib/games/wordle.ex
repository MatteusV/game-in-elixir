defmodule Games.Wordle do
  @moduledoc """
    para de dar error!
  """

  @spec play(integer()) :: atom() | :error
  def play(count \\ 0) do
    user_input_list =
      "Guess the word: "
      |> IO.gets()
      |> String.trim("\n")
      |> split()

    correct_word = Enum.random(["elixir", "erlang"])
    correct_word_length = String.length(correct_word)
    correct_word_list = split(correct_word)

    case check_guess(user_input_list, correct_word_list) do
      {^correct_word_length, _yellow} ->
        IO.puts("You win!")

      {_green, 4} ->
        IO.puts("You lost!")

      {green, yellow} ->
        green_message = "letters in the correct position:: #{green}"
        yellow_message = "letters in the wrong position: #{yellow}"
        IO.puts("#{green_message} | #{yellow_message}")

        play(count + 1)
    end
  end

  @spec split(String.t()) :: [String.t()]
  defp split(string) do
    string_list = String.split(string, "")

    string_list
    |> List.delete_at(length(string_list) - 1)
    |> List.delete_at(0)
  end

  @spec check_guess([String.t()], [String.t()]) :: {integer(), integer()}
  defp check_guess(user_input_list, correct_word_list) do
    user_input_list
    |> Enum.with_index()
    |> Enum.reduce({0, 0}, &reducer(&1, &2, correct_word_list))
  end

  @spec reducer({String.t(), integer()}, {integer(), integer()}, [String.t()]) ::
          {integer(), integer()}
  defp reducer({element, index}, {yellow_count, green_count}, correct_word_list) do
    cond do
      element == Enum.at(correct_word_list, index) -> {yellow_count, green_count + 1}
      Enum.member?(correct_word_list, element) -> {yellow_count + 1, green_count}
      true -> {yellow_count, green_count}
    end
  end
end
