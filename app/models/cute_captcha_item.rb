class CuteCaptchaItem < ActiveRecord::Base
  attr_accessible       :avatar
  attr_accessible       :avatar_file_name
  attr_accessible       :avatar_file_size
  attr_accessible       :avatar_updated_at
  attr_accessible       :fnd_path
  attr_accessible       :im_type


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  scope :random_unlike, lambda { |*args| {:order => "RAND()", :limit => (args.first || 1), :conditions => ["created_at < ? AND im_type != ?", Time.now.utc, args[1]] }}
  scope :a_random_animal, lambda { |*args| {:order => "RAND()", :limit => (1), :conditions => ["created_at < ? AND im_type != ?", Time.now.utc, "OTHER"] }}

end
