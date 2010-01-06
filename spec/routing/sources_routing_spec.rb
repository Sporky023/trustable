require 'spec_helper'

describe SourcesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/sources" }.should route_to(:controller => "sources", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/sources/new" }.should route_to(:controller => "sources", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/sources/1" }.should route_to(:controller => "sources", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/sources/1/edit" }.should route_to(:controller => "sources", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/sources" }.should route_to(:controller => "sources", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/sources/1" }.should route_to(:controller => "sources", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/sources/1" }.should route_to(:controller => "sources", :action => "destroy", :id => "1") 
    end
  end
end
