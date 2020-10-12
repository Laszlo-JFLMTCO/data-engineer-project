require_relative '../components/helper'

class ProductionCompany
  INPUT_COLUMN_ID = "id".freeze
  INPUT_COLUMN_NAME = "name".freeze
  INPUT_COMPANY_LIST_DELIMITER = "}, {".freeze

  GROK_PRODUCTION_COMPANY = /(.*#{INPUT_COLUMN_NAME}': '?)(?<#{INPUT_COLUMN_NAME}>.*?)((',|,) '#{INPUT_COLUMN_ID}': )(?<#{INPUT_COLUMN_ID}>\d*)/
  
  OUTPUT_COLUMN_COMPANY_INPUT_ID = "company_input_id".freeze
  OUTPUT_COLUMN_NAME = "name".freeze
  OUTPUT_HEADERS = [
    OUTPUT_COLUMN_COMPANY_INPUT_ID,
    OUTPUT_COLUMN_NAME
  ].freeze

  class << self
    def convert_to_guild_csv_rows(input)
      parsed_companies = parse_companies_raw(input)
      return [""] if parsed_companies.size < 1
      parsed_companies.map do |parsed_company|
        parsed_company.nil? ? "" : [parsed_company[INPUT_COLUMN_ID], parsed_company[INPUT_COLUMN_NAME]].to_csv.chomp
      end
    end

    def parse_companies_raw(input)
      return [] if input.nil?
      input_list = input.split(INPUT_COMPANY_LIST_DELIMITER)
      input_list.map do |raw_input|
        details = GROK_PRODUCTION_COMPANY.match(raw_input)
        details.nil? ? "" : details.named_captures
      end.filter{|item| !item.empty?}
    end

    def model_headers
      OUTPUT_HEADERS
    end
  end
end