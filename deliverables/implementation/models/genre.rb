require_relative '../components/helper'

class Genre
  INPUT_COLUMN_ID = "id".freeze
  INPUT_COLUMN_NAME = "name".freeze
  INPUT_COLUMN_GENRES = "genres".freeze
  INPUT_GENRE_LIST_DELIMITER = "}, {".freeze

  GROK_GENRE = /(.*#{INPUT_COLUMN_ID}': )(?<#{INPUT_COLUMN_ID}>\d*)(, '#{INPUT_COLUMN_NAME}': ')(?<#{INPUT_COLUMN_NAME}>.*)('.*)/
  
  OUTPUT_COLUMN_GENRE_INPUT_ID = "genre_input_id".freeze
  OUTPUT_COLUMN_NAME = "name".freeze
  OUTPUT_COLUMN_MOVIE_INPUT_ID = "movie_input_id".freeze
  OUTPUT_HEADERS = [
    OUTPUT_COLUMN_GENRE_INPUT_ID,
    OUTPUT_COLUMN_NAME,
    OUTPUT_COLUMN_MOVIE_INPUT_ID
  ].freeze

  class << self
    def convert_to_guild_csv_rows(input)
      parsed_genres = parse_genres_raw(input)
      return [""] if parsed_genres.size < 1
      parsed_genres.map do |parsed_genre|
        parsed_genre.nil? ? "" : [parsed_genre[INPUT_COLUMN_ID], parsed_genre[INPUT_COLUMN_NAME], parsed_genre[OUTPUT_COLUMN_MOVIE_INPUT_ID]].to_csv.chomp
      end
    end

    def parse_genres_raw(input)
      return [] if input.nil?
      input_list = input[INPUT_COLUMN_GENRES].split(INPUT_GENRE_LIST_DELIMITER)
      common = {OUTPUT_COLUMN_MOVIE_INPUT_ID => input[INPUT_COLUMN_ID]}
      input_list.map do |raw_input|
        details = GROK_GENRE.match(raw_input)
        details.nil? ? "" : details.named_captures.merge(common)
      end.filter{|item| !item.empty?}
    end

    def model_headers
      OUTPUT_HEADERS
    end
  end
end