require 'csv'
require_relative 'helper'
require_relative 'production_company_exporter'
require_relative 'movie_exporter'
require_relative 'genre_exporter'

class MoviesMetadataParser
  CSV_ROW_INCREMENTS = 1.freeze
  COLUMN_PRODUCTION_COMPANIES = "production_companies".freeze

  attr_reader :input_csv, :output_dir, :prod_comp_exporter, :movie_exporter, :genre_exporter

  def initialize(input_csv, output_dir)
    @input_csv = input_csv
    @output_dir = output_dir
    @prod_comp_exporter = ProductionCompanyExporter.new(output_dir)
    @movie_exporter = MovieExporter.new(output_dir)
    @genre_exporter = GenreExporter.new(output_dir)
  end

  def process
    CSV.foreach(input_csv, headers: true, converters: :all) do |row|
      @prod_comp_exporter.write(row[COLUMN_PRODUCTION_COMPANIES])
      @movie_exporter.write(row)
      @genre_exporter.write(row)
    end
    close
  end

  def close
    prod_comp_exporter.close
    movie_exporter.close
    genre_exporter.close
  end
end