require_relative 'helper'
require_relative 'movies_metadata_parser'
require_relative 'ratings_parser'
require_relative '../constants/required_input_files'

class InputFileListParser
  include RequiredInputFiles

  attr_reader :source_dir, :output_dir, :movies_meta_parser, :ratings_parser

  def initialize(source_dir)
    @source_dir = source_dir
    @output_dir = create_output_directory
    @movies_meta_parser = MoviesMetadataParser.new(movies_metadata_source, output_dir)
    @ratings_parser = RatingsParser.new(ratings_source, output_dir)
  end

  def build_models
    movies_meta_parser.process
    ratings_parser.process
  end

  def create_output_directory
    new_output_dir = "output-#{Helper.get_current_epoch_time}"
    Dir.mkdir(new_output_dir)
    new_output_dir
  end

  def movies_metadata_source
    Helper.build_file_path(source_dir, MOVIES_METADATA_CSV)
  end

  def ratings_source
    Helper.build_file_path(source_dir, RATINGS_CSV)
  end
end