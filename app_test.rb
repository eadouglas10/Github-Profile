

require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require './app'
require 'pry'

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
    binding.pry
    assert_includes response.body, "Find the repos!"
  end

end
