require 'test_helper'

class ClaimTest < ActiveSupport::TestCase
  should_validate_presence_of :entity, :body, :sources
end
