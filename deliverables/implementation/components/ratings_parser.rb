require 'csv'
require_relative 'helper'
require_relative 'popularity_vote_exporter'

class RatingsParser
  CSV_ROW_INCREMENTS = 1.freeze

  attr_reader :input_csv, :output_dir, :vote_exporter

  def initialize(input_csv, output_dir)
    @input_csv = input_csv
    @output_dir = output_dir
    @vote_exporter = PopularityVoteExporter.new(output_dir)
  end

  def process
    CSV.foreach(input_csv, headers: true, converters: :all) do |row|
      @vote_exporter.write(row)
    end
    close
  end

  def close
    vote_exporter.close
  end
end