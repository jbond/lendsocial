class BusinessConnection < ActiveRecord::Base
  belongs_to :follower, class_name: 'Business'
  belongs_to :followed, class_name: 'Business'
  paginates_per 10
end
