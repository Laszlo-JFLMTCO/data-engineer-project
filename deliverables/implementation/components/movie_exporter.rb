require_relative 'output_writer'
require_relative '../models/movie'

class MovieExporter
  OUTPUT_CSV = "movie.csv".freeze

  attr_reader :csv

  def initialize(output_dir)
    @csv = OutputWriter.new(output_dir, OUTPUT_CSV, Movie.model_headers)
  end

  def write(row)
    movies = Movie.convert_to_guild_csv_rows(row)
    movies.each do |movie|
      csv.write(movie) unless movie.empty?
    end
  end

  def close
    csv.close
  end
end