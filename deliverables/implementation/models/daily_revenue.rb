require_relative '../components/helper'

class DailyRevenue
  INPUT_COLUMN_ID = "id".freeze
  INPUT_COLUMN_REVENUE = "revenue".freeze
  INPUT_COLUMN_RELEASE_DATE = "release_date".freeze
  INPUT_COLUMN_RUNTIME = "runtime".freeze

  OUTPUT_COLUMN_RECEIVED_DATE = "received_date".freeze
  OUTPUT_COLUMN_AMOUNT = "amount".freeze
  OUTPUT_COLUMN_MOVIE_INPUT_ID = "movie_input_id".freeze
  OUTPUT_HEADERS = [
    OUTPUT_COLUMN_RECEIVED_DATE,
    OUTPUT_COLUMN_AMOUNT,
    OUTPUT_COLUMN_MOVIE_INPUT_ID
  ].freeze

  class << self
    def convert_to_guild_csv_rows(input)
      parse_daily_revenue_raw(input).map do |daily_revenue|
         daily_revenue.to_csv.chomp
      end
    end

    def parse_daily_revenue_raw(input)
      daily_amount = calculate_daily_amount(input[INPUT_COLUMN_RUNTIME], input[INPUT_COLUMN_REVENUE])
      (0..input[INPUT_COLUMN_RUNTIME].to_i - 1).map do |day|
        [
          input[INPUT_COLUMN_RELEASE_DATE] + day,
          daily_amount,
          input[INPUT_COLUMN_ID]
        ]
      end
    end

    def calculate_daily_amount(runtime, total_revenue)
      total_revenue.to_f / runtime
    end

    def model_headers
      OUTPUT_HEADERS
    end
  end
end