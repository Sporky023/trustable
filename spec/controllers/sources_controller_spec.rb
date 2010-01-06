require 'spec_helper'

describe SourcesController do

  def mock_source(stubs={})
    @mock_source ||= mock_model(Source, stubs)
  end

  describe "GET index" do
    it "assigns all sources as @sources" do
      Source.stub!(:find).with(:all).and_return([mock_source])
      get :index
      assigns[:sources].should == [mock_source]
    end
  end

  describe "GET show" do
    it "assigns the requested source as @source" do
      Source.stub!(:find).with("37").and_return(mock_source)
      get :show, :id => "37"
      assigns[:source].should equal(mock_source)
    end
  end

  describe "GET new" do
    it "assigns a new source as @source" do
      Source.stub!(:new).and_return(mock_source)
      get :new
      assigns[:source].should equal(mock_source)
    end
  end

  describe "GET edit" do
    it "assigns the requested source as @source" do
      Source.stub!(:find).with("37").and_return(mock_source)
      get :edit, :id => "37"
      assigns[:source].should equal(mock_source)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created source as @source" do
        Source.stub!(:new).with({'these' => 'params'}).and_return(mock_source(:save => true))
        post :create, :source => {:these => 'params'}
        assigns[:source].should equal(mock_source)
      end

      it "redirects to the created source" do
        Source.stub!(:new).and_return(mock_source(:save => true))
        post :create, :source => {}
        response.should redirect_to(source_url(mock_source))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved source as @source" do
        Source.stub!(:new).with({'these' => 'params'}).and_return(mock_source(:save => false))
        post :create, :source => {:these => 'params'}
        assigns[:source].should equal(mock_source)
      end

      it "re-renders the 'new' template" do
        Source.stub!(:new).and_return(mock_source(:save => false))
        post :create, :source => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested source" do
        Source.should_receive(:find).with("37").and_return(mock_source)
        mock_source.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :source => {:these => 'params'}
      end

      it "assigns the requested source as @source" do
        Source.stub!(:find).and_return(mock_source(:update_attributes => true))
        put :update, :id => "1"
        assigns[:source].should equal(mock_source)
      end

      it "redirects to the source" do
        Source.stub!(:find).and_return(mock_source(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(source_url(mock_source))
      end
    end

    describe "with invalid params" do
      it "updates the requested source" do
        Source.should_receive(:find).with("37").and_return(mock_source)
        mock_source.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :source => {:these => 'params'}
      end

      it "assigns the source as @source" do
        Source.stub!(:find).and_return(mock_source(:update_attributes => false))
        put :update, :id => "1"
        assigns[:source].should equal(mock_source)
      end

      it "re-renders the 'edit' template" do
        Source.stub!(:find).and_return(mock_source(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested source" do
      Source.should_receive(:find).with("37").and_return(mock_source)
      mock_source.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the sources list" do
      Source.stub!(:find).and_return(mock_source(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(sources_url)
    end
  end

end
