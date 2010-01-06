require 'test_helper'

class ClaimsControllerTest < ActionController::TestCase

  should_route :get, '/claims/new', :controller => 'claims', :action => 'new'
  should_route :get, '/claims/1', :controller => 'claims', :action => 'show', :id => 1
  should_route :post, '/claims', :controller => 'claims', :action => 'create'
  
  context "on get to new" do
    setup do
      get :new
    end
    
    should_render_template 'new'
    should_assign_to :claim
    
    should "have a form" do
      assert_select "form[action=?]", claims_path do
        assert_select "input[type=text][name=?]", 'claim[entity]'
        assert_select "textarea[name=?]", 'claim[body]'
        assert_select "textarea[name=?]", 'claim[sources]'
        assert_select "input[type=submit]"
      end
    end
    
  end
  
  context "on post to create with valid data" do
    setup do
      post :create, :claim => {:entity => "George Bush", :body => '"We will be out of Iraq in 3 months or less"', :sources => "nytimes.com/foo"}
    end
    should_redirect_to "claims_path"
    should_change 'Claim.count', :by => 1
  end
  
  context "on post to create with invalid data" do 
    setup do
      post :create, :claim => {}
    end
    should_set_the_flash_to "You had some information missing in your claim"
    should_render_template "new"
    should_assign_to :claim  
  end

  context "on get to index" do 
    setup do
      @gwb = Factory(:claim, :entity => 'GWB')
      Factory(:claim, :entity => 'BMO')
      get :index
    end
    
    should_render_template 'index'
    should_assign_to :claims
    
    should "show the GWB claim" do
      assert_select "div[class=claim]"
      assert_select 'a[href=?]', claim_path(@gwb)
      assert_match "GWB", @response.body
    end
    
    should "show the BMO claim" do
      assert_match "BMO", @response.body
    end
    
    
  end
  

end
