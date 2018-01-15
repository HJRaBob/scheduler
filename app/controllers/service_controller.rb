class ServiceController < ApplicationController
    before_action :authenticate_user!
    
    def main
        @user = current_user
    end

    def setting
        
    end
end
