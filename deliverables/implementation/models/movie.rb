require_relative '../components/helper'

class Movie
  INPUT_COLUMN_ID = "id".freeze
  INPUT_COLUMN_BUDGET = "budget".freeze
  INPUT_COLUMN_ORIGINAL_TITLE = "origin_title".freeze
  INPUT_COLUMN_RELEASE_DATE = "release_date".freeze
  INPUT_COLUMN_STATUS = "status".freeze
  INPUT_RELEASED_STATUS = "released".freeze

  OUTPUT_COLUMN_MOVIE_INPUT_ID = "movie_input_id".freeze
  OUTPUT_COLUMN_BUDGET = "budget".freeze
  OUTPUT_COLUMN_TITLE = "title".freeze
  OUTPUT_COLUMN_RELEASE_DATE = "release_date".freeze
  OUTPUT_COLUMN_RELEASED = "released".freeze
  OUTPUT_HEADERS = [
    OUTPUT_COLUMN_MOVIE_INPUT_ID,
    OUTPUT_COLUMN_BUDGET,
    OUTPUT_COLUMN_TITLE,
    OUTPUT_COLUMN_RELEASE_DATE,
    OUTPUT_COLUMN_RELEASED
  ].freeze

  class << self
    def convert_to_guild_csv_rows(input)
      [parse_movie_raw(input).to_csv.chomp]
    end

    def parse_movie_raw(input)
      [
        input[INPUT_COLUMN_ID],
        input[INPUT_COLUMN_BUDGET],
        input[OUTPUT_COLUMN_TITLE],
        input[INPUT_COLUMN_RELEASE_DATE],
        get_released(input[INPUT_COLUMN_STATUS])
      ]
    end

    def get_released(status)
      status.downcase == INPUT_RELEASED_STATUS
    end

    def model_headers
      OUTPUT_HEADERS
    end
  end
end