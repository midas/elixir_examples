defmodule Id3ParserTest do

  use ExUnit.Case

  test "the MP3 sample file is present" do
    assert File.exists?( "sample.mp3" ) == true
  end

  test "the album parses correctly" do
    parsed = Id3Parser.parse( "sample.mp3" )
    assert binary_to_string( parsed[:album] ) == "Ask The Fish (Live)"
  end

  test "the artist parses correctly" do
    parsed = Id3Parser.parse( "sample.mp3" )
    assert binary_to_string( parsed[:artist] ) == "Leftover Salmon"
  end

  test "the comment parses correctly" do
    parsed = Id3Parser.parse( "sample.mp3" )
    assert binary_to_string( parsed[:comment] ) == "                            \n"
  end

  test "the title parses correctly" do
    parsed = Id3Parser.parse( "sample.mp3" )
    assert binary_to_string( parsed[:title] ) == "Cactus Flower"
  end

  test "the year parses correctly" do
    parsed = Id3Parser.parse( "sample.mp3" )
    assert binary_to_string( parsed[:year] ) == "1997"
  end

  # not sure why trailing zeros in a binary cause it to not be represented 
  # (or equal) as a string
  defp binary_to_string( binary ) do
    to_string( Enum.filter( to_char_list( binary ), fn(e) -> e != 0 end ))
  end

end
