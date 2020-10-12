require_relative 'components/arg_parser'
require_relative 'components/input_file_list_parser'

include ArgParser

parser = InputFileListParser.new(get_input_dir)
parser.build_models