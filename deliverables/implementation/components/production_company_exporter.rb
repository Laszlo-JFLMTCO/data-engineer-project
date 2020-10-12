require_relative 'output_writer'
require_relative '../models/production_company'

class ProductionCompanyExporter
  OUTPUT_CSV = "production_company.csv".freeze

  attr_reader :csv

  def initialize(output_dir)
    @csv = OutputWriter.new(output_dir, OUTPUT_CSV, ProductionCompany.model_headers)
  end

  def write(row)
    companies = ProductionCompany.convert_to_guild_csv_rows(row)
    companies.each do |company|
      csv.write(company) unless company.empty?
    end
  end

  def close
    csv.close
  end
end