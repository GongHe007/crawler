class Video < ActiveRecord::Base
  validates_uniqueness_of :url

  LOL = 0
end