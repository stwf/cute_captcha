require 'active_support'

module CuteCaptcha 
  class CuteCaptchaItem < ActiveRecord::Base
    attr_accessible       :avatar
    attr_accessible       :avatar_file_name
    attr_accessible       :avatar_file_size
    attr_accessible       :avatar_updated_at
    attr_accessible       :fnd_path
    attr_accessible       :im_type


    has_attached_file :avatar,
      :dependent => :destroy,
      :hash_secret => "THisIsAlongSecretString",
      :styles => { :original => "300x300#", :thumb => "100x100#" },
      :path => "public/images/:class/:attachment/:id_partition/:basename_:style.:extension",
      :url => "/images/:class/:attachment/:id_partition/:basename_:style.:extension"
      
    before_create :randomize_file_name



    def self.random_unlike( a_cnt, an_ty )
    	all(  :order => "RAND()", :limit => (a_cnt || 1),
    			:conditions => ["created_at < ? AND im_type != ?", Time.now.utc, an_ty] )
    end

    def self.a_random_animal
    	random_unlike( 1, "OTHER" )
    end

    private

    def randomize_file_name
      extension = File.extname(avatar_file_name).downcase
      self.avatar.instance_write(:file_name, "#{SecureRandom.hex}#{extension}")
    end
  end
end
