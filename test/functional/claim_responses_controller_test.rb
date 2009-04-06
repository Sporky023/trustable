require 'test_helper'

class ClaimResponsesControllerTest < ActionController::TestCase
  
  context "when I want to create a new ClaimResponse" do
    setup do
      get :new
    end
    should_render_template 'new'
    should_assign_to :claim_response
    
    should "have a form" do
      assert_select "form[action=?]", claim_responses_path do
        assert_select "textarea[name=?]", 'claim_response[body]'
        assert_select "textarea[name=?]", 'claim_response[sources]'
        assert_select "input[type=radio][name=?][value=]", 'claim_response[truth]', 'true'
        assert_select "input[type=radio][name=?][value=]", 'claim_response[truth]', 'false' 
      end
    end    
  end
  
  #context "when I submit the ClaimResponse form correctly" do
  #end
  
  #context "when I try to post a new response with an empty body" do
  #end
  
  #context "when I try to post a new response without true or false selected" do
  #end
  
  #context "when I want to see all the responses to a claim" do
  #end
  
end
