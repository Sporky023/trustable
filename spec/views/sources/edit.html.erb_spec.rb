require 'spec_helper'

describe "/sources/edit.html.erb" do
  include SourcesHelper

  before(:each) do
    assigns[:source] = @source = stub_model(Source,
      :new_record? => false,
      :url => "value for url"
    )
  end

  it "renders the edit source form" do
    render

    response.should have_tag("form[action=#{source_path(@source)}][method=post]") do
      with_tag('input#source_url[name=?]', "source[url]")
    end
  end
end
