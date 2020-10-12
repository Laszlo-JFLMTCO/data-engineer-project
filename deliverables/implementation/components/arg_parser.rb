module ArgParser
  REQUIRED_NUMBER_OF_ARGUMENTS = 1.freeze

  def get_input_dir
    verify_args
    ARGV[0]
  end

  def verify_args
    if ARGV.length != REQUIRED_NUMBER_OF_ARGUMENTS
      puts "Received #{ARGV.length} vs the required #{REQUIRED_NUMBER_OF_ARGUMENTS}"
      exit
    end
  end
end