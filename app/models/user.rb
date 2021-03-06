class User < ActiveRecord::Base
  has_secure_password
  has_many :gazorpians

  def slug
    self.username.split(' ').join('-')
  end

  def self.find_by_slug(slug)
    self.all.select do |user|
      user.slug == slug
    end.first
  end
end
