defmodule Games.Wordle do
  def play(count \\ 0) do
    user_input = "Guess the word: " |> IO.gets() |> String.trim("\n")
    user_input_list = split_string(user_input)
    correct_word = Enum.random(["elixir", "erlang"])
    correct_word_list = split_string(correct_word)

    {yellow, green} = compare_string(user_input_list, correct_word_list)

    if(green == 6) do
      IO.puts("You win!")
    else
      if(count >= 4) do
        IO.puts("You lost!")
      else
        IO.puts(
          "letters in the correct position:: #{green} | letters in the wrong position: #{yellow}"
        )
        play(count + 1)
      end
    end
  end

  defp split_string(string) do
    string_list = string |> String.split("")
    string_length = string_list |> length()
    string_list = List.delete_at(string_list, string_length - 1)
    string_list = List.delete_at(string_list, 0)
    string_list
  end

  defp compare_string(user_input_list, correct_word_list) do
    {yellow, green} =
      Enum.with_index(user_input_list)
      |> Enum.reduce({0, 0}, fn {element, index}, {yellow_count, green_count} ->
        correct_element = Enum.at(correct_word_list, index)

        if element == correct_element do
          {yellow_count, green_count + 1}
        else
          if Enum.member?(correct_word_list, element) do
            {yellow_count + 1, green_count}
          else
            {yellow_count, green_count}
          end
        end
      end)

    {yellow, green}
  end
end
