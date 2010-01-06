require 'spec_helper'

describe "/sources/show.html.erb" do
  include SourcesHelper
  before(:each) do
    assigns[:source] = @source = stub_model(Source,
      :url => "value for url"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ url/)
  end
end
