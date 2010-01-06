require 'spec_helper'

describe "/sources/new.html.erb" do
  include SourcesHelper

  before(:each) do
    assigns[:source] = stub_model(Source,
      :new_record? => true,
      :url => "value for url"
    )
  end

  it "renders new source form" do
    render

    response.should have_tag("form[action=?][method=post]", sources_path) do
      with_tag("input#source_url[name=?]", "source[url]")
    end
  end
end
