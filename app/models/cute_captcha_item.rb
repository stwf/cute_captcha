class CuteCaptchaItem < ActiveRecord::Base
  attr_accessible       :avatar
  attr_accessible       :avatar_file_name
  attr_accessible       :avatar_file_size
  attr_accessible       :avatar_updated_at
  attr_accessible       :fnd_path
  attr_accessible       :im_type


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }



  def self.random_unlike( a_cnt, an_ty )
  	all(  :order => "RAND()", :limit => (a_cnt || 1),
  			:conditions => ["created_at < ? AND im_type != ?", Time.now.utc, an_ty] )
  end

  def self.a_random_animal
  	random_unlike( 1, "OTHER" )
  end

end
