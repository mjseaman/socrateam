require 'test_helper'

class BootTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Boot.new.valid?
  end
end
