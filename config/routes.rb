ActionController::Routing::Routes.draw do |map|
  map.resources :sources


  map.resources :claims
  
  map.resources :claim_responses
  

end
