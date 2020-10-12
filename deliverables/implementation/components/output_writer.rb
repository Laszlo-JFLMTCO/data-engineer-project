require_relative 'helper'

class OutputWriter
  END_OF_RECORD = "\r\n".freeze

  attr_reader :output_path, :csv, :headers

  def initialize(output_dir, output_csv, headers)
    @headers = headers
    @output_path = Helper.build_file_path(output_dir, output_csv)
    @csv = start_csv_output
    add_header_row
  end

  def start_csv_output
    File.open(output_path, "a")
  end

  def add_header_row
    csv_headers = headers.to_csv.chomp
    write(csv_headers)
  end

  def write(row)
    csv.write(row + END_OF_RECORD)
  end

  def close
    csv.close
  end
end