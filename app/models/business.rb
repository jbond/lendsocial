class Business < ActiveRecord::Base
  has_many :user_businesses
  has_many :users, :through => :user_businesses
  has_many :postings, :class_name => "Message", :as => :posted_to
  has_many :loans
  belongs_to :industry, :class_name => "BusinessIndustry", :foreign_key => "business_industry_id"
  has_many :follower_associations, :class_name => "BusinessFollowing", :foreign_key => "followed_id"
  has_many :followers, :through => :follower_associations, :source => :follower
  
  def owner
    self.users.where("role = ?", "Owner").first
  end
end
