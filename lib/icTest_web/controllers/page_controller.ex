defmodule IcTestWeb.PageController do
  use IcTestWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  @doc"Function for converting numbers to meaningful words"
  def add(conn, params) do

    number = params["number"]
    len = String.length(number)
    if (!is_nil(number) and len == 10) do

      dic = System.get_env("IC_PRIVATE_KEY")
      {:ok, _rawSkey} = File.read(dic)
      new_data = File.stream!(dic) |>
        Enum.map( &(String.replace(&1, "\n", "")) )
         |> Enum.with_index
         |> Enum.map( fn({contents, _line_num}) ->
           String.downcase("#{contents}")
        end)

      dif = String.split(number, "")
      av = List.delete_at(dif, 0)
      ad = List.delete_at(av, 10)
      data = Enum.map(ad, fn (x) ->
                case x do
                   "2" -> ["a", "b", "c"]
                   "3" -> ["d", "e", "f"]
                   "4" -> ["g", "h", "i"]
                   "5" -> ["j", "k", "l"]
                   "6" -> ["m", "n", "o"]
                   "7" -> ["p", "q", "r", "s"]
                   "8" -> ["t", "u", "v"]
                   "9" -> ["w", "x", "y", "z"]
                end
              end)

       first = Enum.at(data, 0)
       second = Enum.at(data, 1)
       third = Enum.at(data, 2)
       fourth = Enum.at(data, 3)
       fifth = Enum.at(data, 4)
       sixth = Enum.at(data, 5)
       seventh = Enum.at(data, 6)
       eight = Enum.at(data, 7)
       ninth = Enum.at(data, 8)
       tenth = Enum.at(data, 9)

      f_1 = Enum.map(first, fn (s) ->
               Enum.filter(new_data, fn (k) ->
                 String.first(k) == s  end)
           end)

      f_2 = Enum.map(second, fn (s) ->
                Enum.filter(new_data, fn (k) ->
                  String.at(k, 1) == s  end)
            end)

      f_3 = Enum.map(third, fn (s) ->
          Enum.filter(new_data, fn (k) ->
            String.at(k, 2) == s  end)
      end)

      f_4 = Enum.map(fourth, fn (s) ->
        Enum.filter(new_data, fn (k) ->
          String.at(k, 3) == s  end)
      end)

      f_5 = Enum.map(fifth, fn (s) ->
        Enum.filter(new_data, fn (k) ->
          String.at(k, 4) == s  end)
      end)

      f_6 = Enum.map(sixth, fn (s) ->
        Enum.filter(new_data, fn (k) ->
          String.at(k, 5) == s  end)
      end)

      f_7 = Enum.map(seventh, fn (s) ->
        Enum.filter(new_data, fn (k) ->
          String.at(k, 6) == s  end)
      end)

      f_8 = Enum.map(eight, fn (s) ->
        Enum.filter(new_data, fn (k) ->
          String.at(k, 7) == s  end)
      end)

      f_9 = Enum.map(ninth, fn (s) ->
        Enum.filter(new_data, fn (k) ->
          String.at(k, 8) == s  end)
      end)

      f_10 = Enum.map(tenth, fn (s) ->
        Enum.filter(new_data, fn (k) ->
          String.at(k, 9) == s  end)
      end)
      json conn, "OK"
    else
    json conn, %{status_code: "4003", message: "Please enter proper number"}
    end
  end
end
