ActiveRecord::Schema.define(:version => 0) do

  create_table :cute_captcha_items do |t|
    t.string :fnd_path
    t.string :im_type
    t.string :avatar_file_name
    t.string :avatar_content_type
    t.integer :avatar_file_size
    t.datetime :avatar_updated_at

    t.timestamps
  end
  
end