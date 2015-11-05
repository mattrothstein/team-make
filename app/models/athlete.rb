class Athlete < ActiveRecord::Base
  has_one :tryout
end
