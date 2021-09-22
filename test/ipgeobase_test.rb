# frozen_string_literal: true

require_relative "test_helper"

# Ipgeobase Test Class
class IpgeobaseTest < Minitest::Test
  def test_that_it_has_a_version
    refute_nil ::Ipgeobase::VERSION
  end

  def test_ipgeobase
    raw_response_file = File.open(File.expand_path("../test/response.xml", __dir__), "r")

    stub_request(:get, "http://ip-api.com/xml/8.8.8.8").to_return(body: raw_response_file.read, status: 200)

    ip_meta = Ipgeobase.lookup("8.8.8.8")

    assert_equal "Ashburn", ip_meta.city
    assert_equal "United States", ip_meta.country
    assert_equal "US", ip_meta.country_code
    assert_equal "39.03", ip_meta.lat
  end
end
