class Boot < ActiveRecord::Base
  attr_accessible :cohort, :name, :email, :github, :quora, :twitter, :facebook, :linked_in, :blog, :hacker_news, :dbc_id
end
