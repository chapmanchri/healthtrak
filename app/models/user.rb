class User < ActiveRecord::Base

has_many :events

def self.authenticate(email, password)

    @user = User.find_by_email(email)

    if !@user.nil?
      if @user.password == password
        return @user
      end
    end

    return nil
  end


end
