require 'spec_helper'

describe Source do
  before(:each) do
    @valid_attributes = {
      :url => "value for url"
    }
  end

  it "should create a new instance given valid attributes" do
    Source.create!(@valid_attributes)
  end
end
