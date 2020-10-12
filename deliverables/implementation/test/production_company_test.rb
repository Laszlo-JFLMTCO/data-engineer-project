require 'minitest/autorun'
require_relative '../models/production_company'
require 'csv'

class TestProductionCompany < Minitest::Test
  def test_parsing_raw_companies_input_single_company
    test_input = "[{'name': 'TriStar Pictures', 'id': 559}]"
    actual = ProductionCompany.parse_companies_raw(test_input)
    expected = [{"name"=>"TriStar Pictures", "id"=>"559"}]
    assert_equal expected, actual
  end

  def test_parsing_raw_companies_input_three_companies
    test_input = "[{'name': 'TriStar Pictures', 'id': 559}, {'name': 'Teitler Film', 'id': 2550}, {'name': 'Interscope Communications', 'id': 10201}]"
    actual = ProductionCompany.parse_companies_raw(test_input)
    expected = [{"name"=>"TriStar Pictures", "id"=>"559"}, {"name"=>"Teitler Film", "id"=>"2550"}, {"name"=>"Interscope Communications", "id"=>"10201"}]
    assert_equal expected, actual
  end

  def test_parsing_raw_companies_input_is_empty_array
    test_input = "[]"
    actual = ProductionCompany.parse_companies_raw(test_input)
    expected = []
    assert_equal expected, actual
  end

  def test_parsing_raw_companies_input_is_nil
    test_input = nil
    actual = ProductionCompany.parse_companies_raw(test_input)
    expected = []
    assert_equal expected, actual
  end

  def test_parsing_raw_companies_input_is_empty_string
    test_input = ""
    actual = ProductionCompany.parse_companies_raw(test_input)
    expected = []
    assert_equal expected, actual
  end

  def test_converting_to_guild_csv_rows_input_single_company
    test_input = "[{'name': 'TriStar Pictures', 'id': 559}]"
    actual = ProductionCompany.convert_to_guild_csv_rows(test_input)
    expected = ["559,TriStar Pictures"]
    assert_equal expected, actual
  end

  def test_converting_to_guild_csv_rows_input_single_company_with_layered_quotes
    test_input = "[{'name': ""Club d'Investissement Média"", 'id': 8170}]"
    actual = ProductionCompany.convert_to_guild_csv_rows(test_input)
    expected = ["8170,Club d'Investissement Média"]
    assert_equal expected, actual
  end

  def test_converting_to_guild_csv_rows_input_three_companies
    test_input = "[{'name': ""Club d'Investissement Média"", 'id': 8170}, {'name': 'Teitler Film', 'id': 2550}, {'name': 'Interscope Communications', 'id': 10201}]"
    actual = ProductionCompany.convert_to_guild_csv_rows(test_input)
    expected = ["8170,Club d'Investissement Média", "2550,Teitler Film", "10201,Interscope Communications"]
    assert_equal expected, actual
  end

  def test_converting_to_guild_csv_rows_input_is_empty_array
    test_input = "[]"
    actual = ProductionCompany.convert_to_guild_csv_rows(test_input)
    expected = [""]
    assert_equal expected, actual
  end

  def test_converting_to_guild_csv_rows_input_is_nil
    test_input = nil
    actual = ProductionCompany.convert_to_guild_csv_rows(test_input)
    expected = [""]
    assert_equal expected, actual
  end

  def test_converting_to_guild_csv_rows_input_is_empty_string
    test_input = ""
    actual = ProductionCompany.convert_to_guild_csv_rows(test_input)
    expected = [""]
    assert_equal expected, actual
  end

end