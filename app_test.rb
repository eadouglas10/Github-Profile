require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require './app'

class AppTest < Minitest::Test

  include Rack::Test::Methods

  def app
    RepoApp
  end

  def test_reality
    assert true
  end

  def test_root
    response = get("/")
    assert_equal "Enter a Github username", response.body
  end

end
