require_relative '../lib/district_repository'
require 'pry'

class EnrollmentTest < Minitest::Test
  def test_online_participation_in_year
    dr = DistrictRepository.from_csv('/Online pupil enrollment.csv')
    district = dr.find_by_name("ACADEMY 20")

    assert_equal 341, district.enrollment.online_participation_in_year(2013)
  end

  def test_remediation_in_higher_education
    dr = DistrictRepository.from_csv('/Remediation in higher education.csv')
    district = dr.find_by_name("ACADEMY 20")

    assert_equal 0.264, district.enrollment.online_participation_in_year(2009)
  end

  def test_kindergartners_in_full_day_programs
    dr = DistrictRepository.from_csv('/Kindergartners in full-day program.csv')
    district = dr.find_by_name("ACADEMY 20")

    assert_equal 0.391, district.enrollment.online_participation_in_year(2007)
  end

  def test_graduation_rate_in_year
    dr = DistrictRepository.from_csv('/High school graduation rates.csv')
    district = dr.find_by_name("ACADEMY 20")

    assert_equal 0.895, district.enrollment.graduation_rate_in_year(2010)
  end

  def test_edge_case_truncate_floats
    dr = DistrictRepository.from_csv('/High school graduation rates.csv')
    district = dr.find_by_name("ACADEMY 20")

    assert_equal 0.889, district.enrollment.graduation_rate_in_year(2012)
  end

  def test_special_education
    dr = DistrictRepository.from_csv('/Special education.csv')
    # district = dr.find_by_name("ACADEMY 20")

    # assert_equal 0.889, district.enrollment.graduation_rate_in_year(2012)
  end
end
