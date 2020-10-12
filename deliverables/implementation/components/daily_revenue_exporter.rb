require_relative 'output_writer'
require_relative '../models/daily_revenue'

class DailyRevenueExporter
  OUTPUT_CSV = "daily_revenue.csv".freeze

  attr_reader :csv

  def initialize(output_dir)
    @csv = OutputWriter.new(output_dir, OUTPUT_CSV, DailyRevenue.model_headers)
  end

  def write(row)
    amounts = DailyRevenue.convert_to_guild_csv_rows(row)
    amounts.each do |amount|
      csv.write(amount) unless amount.empty?
    end
  end

  def close
    csv.close
  end
end