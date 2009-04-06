class Claim < ActiveRecord::Base

  validates_presence_of :entity, :body, :sources

end
