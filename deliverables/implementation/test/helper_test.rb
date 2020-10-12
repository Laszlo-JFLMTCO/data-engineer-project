require 'minitest/autorun'
require_relative '../components/helper'


class TestHelper < Minitest::Test
  def test_directory_filename_provided_case_1
    test_input_dir = "directory_testing"
    test_input_csv = "testfile.csv"
    actual = Helper.build_file_path(test_input_dir, test_input_csv)
    expected = "#{test_input_dir}/#{test_input_csv}"
    assert_equal expected, actual
  end

  def test_directory_filename_provided_case_2
    test_input_dir = "directory_eval"
    test_input_csv = "evalfile.csv"
    actual = Helper.build_file_path(test_input_dir, test_input_csv)
    expected = "#{test_input_dir}/#{test_input_csv}"
    assert_equal expected, actual
  end

  def test_directory_has_bonus_slash
    test_input_dir = "directory_eval/"
    test_input_csv = "evalfile.csv"
    actual = Helper.build_file_path(test_input_dir, test_input_csv)
    expected = "directory_eval/#{test_input_csv}"
    assert_equal expected, actual
  end

  def test_no_directory_name_provided_returns_filename_only
    test_input_dir = ""
    test_input_csv = "testfile.csv"
    actual = Helper.build_file_path(test_input_dir, test_input_csv)
    expected = test_input_csv
    assert_equal expected, actual
  end

  def test_get_current_time_in_epoch_format
    actual = Helper.get_current_epoch_time
    expected = Time.now.to_i
    assert_in_delta expected, actual, 1
  end

  def test_convert_string_to_array
    test_input = "[{'name': 'Pixar Animation Studios', 'id': 3}]"
    actual = Helper.convert_string_to_array(test_input)
    expected = [{"name"=>"Pixar Animation Studios", "id"=>3}]
    assert_instance_of Array, actual
    assert_equal expected.size, actual.size
    assert_equal expected, actual
  end

  def test_convert_string_to_array_with_multiple_items
    test_input = "[{'name': 'TriStar Pictures', 'id': 559}, {'name': 'Teitler Film', 'id': 2550}, {'name': 'Interscope Communications', 'id': 10201}]"
    actual = Helper.convert_string_to_array(test_input)
    expected = [{"name"=>"TriStar Pictures", "id"=>559}, {"name"=>"Teitler Film", "id"=>2550}, {"name"=>"Interscope Communications", "id"=>10201}]
    assert_instance_of Array, actual
    assert_equal expected.size, actual.size
    assert_equal expected, actual
  end
  
  def test_convert_string_to_array_with_multiple_layers_of_quotes
    test_input = "[{'name': ""Club d'Investissement Média"", 'id': 8170}]"
    actual = Helper.convert_string_to_array(test_input)
    expected = [{"name"=>"Club d'Investissement Média", "id"=>8170}]
    assert_instance_of Array, actual
    assert_equal expected.size, actual.size
    assert_equal expected, actual
  end

end