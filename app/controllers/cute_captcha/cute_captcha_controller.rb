module CuteCaptcha 
  module CuteCaptchaController
    
    def setup_status
      puts( "entering status")
      @usr_message = ""
      if ( @right_image )
        if ( @capcha_error.nil? || ( @capcha_error == 0 ) )
          @usr_message = "Prove you are human! Find the %s" % [@right_image.im_type]
          @usr_state = "signupYelp"
        elsif ( @capcha_error == 1 )
          @usr_state = "signupYelpRed"
          @usr_message = "You failed the test! Find the %s" % [@right_image.im_type]
        else
          @usr_state = "signupYelpRed"
          @usr_message = "You failed the test %s times, ROBOT! Find the %s if you can!" % [@capcha_error, @right_image.im_type]
        end
      else
        puts( "exitin no image status")
        
        @usr_message = "No cute captchas available, try seeding the databse"
      end

      if ( @password_error == 0 )
        @usr_pw_message = ""
        @usr_pw_state = "passwordYelp"
      elsif ( @password_error == 1 )
        @usr_pw_message = "The passwords do not match"
        @usr_pw_state = "passwordYelpRed"
      end
    end


    def setup_captcha
      @images_list    = []
      @aGu            = CuteCaptchaItem.a_random_animal.first
      @right_image    = nil

      if ( @aGu )
        @gul = CuteCaptchaItem.random_unlike( 5, @aGu.im_type )

        @images_list << @aGu
        @images_list = @images_list + @gul

        @right_image = @images_list[0]
        @images_list.shuffle!

        Rails.logger.debug( @images_list )
      end
    
    end

    def verify_it
      answer = false
      if ( params[:cucapcha_choice ] )
        @a_help = CuteCaptchaItem.first( :conditions => {:id => params[:cucapcha_choice ] } )
        answer = @a_help.im_type == params[:right_one ]
      end
      answer
    end

  end

end