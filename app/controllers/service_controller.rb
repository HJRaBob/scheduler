class ServiceController < ApplicationController
    def main
        @user = current_user
        @service = Service.where(:user_id => current_user.id).order("sequence ASC")
    end

    def setting
        
    end

    def save
    
    end

    def allocate
        i = 0;
        services = Service.where(:user_id => current_user.id).order("sequence ASC")
        positions = params[:position]
        positions.each do |sequence, position|
            services[i].update(:position_x => position['col'].to_i,:position_y => position['row'].to_i)
            i = i+1
        end
    end
end
