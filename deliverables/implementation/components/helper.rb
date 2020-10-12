require 'json'

class Helper
  class << self
    def build_file_path(input_dir, input_csv)
      return input_csv if input_dir.length == 0
      File.join(input_dir.delete_suffix("/"), input_csv)
    end

    def get_current_epoch_time
      Time.now.to_i
    end

    def convert_string_to_array(input)
      JSON.parse(input.gsub("'", "\""))
    end

    def epoch_to_timestamp(epoch)
      Time.at(epoch).utc
    end
  end
end