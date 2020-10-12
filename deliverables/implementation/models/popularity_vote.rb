require_relative '../components/helper'

class PopularityVote
  INPUT_COLUMN_USER_ID = "userId".freeze
  INPUT_COLUMN_MOVIE_ID = "movieId".freeze
  INPUT_COLUMN_RATING = "rating".freeze
  INPUT_COLUMN_TIMESTAMP = "timestamp".freeze

  OUTPUT_COLUMN_USER_ID = "user_id".freeze
  OUTPUT_COLUMN_MOVIE_INPUT_ID = "movie_input_id".freeze
  OUTPUT_COLUMN_RATING = "rating".freeze
  OUTPUT_COLUMN_SUBMITTED = "submitted".freeze
  OUTPUT_HEADERS = [
    OUTPUT_COLUMN_USER_ID,
    OUTPUT_COLUMN_MOVIE_INPUT_ID,
    OUTPUT_COLUMN_RATING,
    OUTPUT_COLUMN_SUBMITTED
  ].freeze

  class << self
    def convert_to_guild_csv_rows(input)
      [parse_popularity_vote_raw(input).to_csv.chomp]
    end

    def parse_popularity_vote_raw(input)
      [
        input[INPUT_COLUMN_USER_ID],
        input[INPUT_COLUMN_MOVIE_ID],
        input[INPUT_COLUMN_RATING],
        Helper.epoch_to_timestamp(input[INPUT_COLUMN_TIMESTAMP])
      ]
    end

    def model_headers
      OUTPUT_HEADERS
    end
  end
end