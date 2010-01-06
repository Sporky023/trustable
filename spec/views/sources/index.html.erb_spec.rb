require 'spec_helper'

describe "/sources/index.html.erb" do
  include SourcesHelper

  before(:each) do
    assigns[:sources] = [
      stub_model(Source,
        :url => "value for url"
      ),
      stub_model(Source,
        :url => "value for url"
      )
    ]
  end

  it "renders a list of sources" do
    render
    response.should have_tag("tr>td", "value for url".to_s, 2)
  end
end
