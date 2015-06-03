defmodule Id3Parser do

  def parse( file_name ) do
    case File.read( file_name ) do
      {:ok, binary} ->
        mp3_byte_size = (byte_size( binary ) - 128)
        << _data :: binary-size(mp3_byte_size), id3_tag :: binary >> = binary
        << "TAG",
            title   :: binary-size(30), 
            artist  :: binary-size(30), 
            album   :: binary-size(30), 
            year    :: binary-size(4), 
            comment :: binary-size(30), 
            _rest   :: binary >> = id3_tag
        %{:album => album, :artist => artist, :comment => comment, :title => title, :year => year}
      _ -> 
        IO.puts "Couldn't open #{file_name}"
    end
  end

end
