require_relative 'output_writer'
require_relative '../models/popularity_vote'

class PopularityVoteExporter
  OUTPUT_CSV = "popularity_vote.csv".freeze

  attr_reader :csv

  def initialize(output_dir)
    @csv = OutputWriter.new(output_dir, OUTPUT_CSV, PopularityVote.model_headers)
  end

  def write(row)
    votes = PopularityVote.convert_to_guild_csv_rows(row)
    votes.each do |vote|
      csv.write(vote) unless vote.empty?
    end
  end

  def close
    csv.close
  end
end