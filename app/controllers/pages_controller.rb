class PagesController < ApplicationController
    # check that a user is logged in before taking you to the home page
    before_action :authenticate_user!

    def home
    end

    
end
