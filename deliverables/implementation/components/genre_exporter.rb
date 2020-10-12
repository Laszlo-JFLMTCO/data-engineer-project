require_relative 'output_writer'
require_relative '../models/genre'

class GenreExporter
  OUTPUT_CSV = "genre.csv".freeze

  attr_reader :csv

  def initialize(output_dir)
    @csv = OutputWriter.new(output_dir, OUTPUT_CSV, Genre.model_headers)
  end

  def write(row)
    genres = Genre.convert_to_guild_csv_rows(row)
    genres.each do |genre|
      csv.write(genre) unless genre.empty?
    end
  end

  def close
    csv.close
  end
end