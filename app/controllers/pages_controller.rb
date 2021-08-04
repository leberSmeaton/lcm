class PagesController < ApplicationController
    # check that a user is logged in before taking you to the home page
    before_action :authenticate_user!, except: [:home, :about]

    def home
    end

    def about
    end
    
end
