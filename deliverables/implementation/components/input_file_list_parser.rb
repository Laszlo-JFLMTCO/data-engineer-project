require_relative 'helper'
require_relative 'movies_metadata_parser'
require_relative '../constants/required_input_files'

class InputFileListParser
  include RequiredInputFiles

  attr_reader :source_dir, :movies_meta_parser

  def initialize(source_dir)
    @source_dir = source_dir
    @movies_meta_parser = MoviesMetadataParser.new(movies_metadata_source, create_output_directory)
  end

  def build_models
    movies_meta_parser.process
  end

  def create_output_directory
    new_output_dir = "output-#{Helper.get_current_epoch_time}"
    Dir.mkdir(new_output_dir)
    new_output_dir
  end

  def movies_metadata_source
    Helper.build_file_path(source_dir, MOVIES_METADATA_CSV)
  end
end