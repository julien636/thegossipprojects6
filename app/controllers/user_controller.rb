class UserController < ApplicationController
  def udisplay
    @user=User.all
  end
end
