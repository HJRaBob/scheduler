class ServiceController < ApplicationController
    before_action :authenticate_user!

    def main
        @user = current_user
        @service = Service.where(:user_id => current_user.id).order("sequence ASC")
        @post = Post.new
        @posts = Post.all
    end

    def setting
        @user = current_user
        @service = Service.where(:user_id => current_user.id).order("sequence ASC")
    end

    def save
        User.find(current_user.id).update(
            :location => params[:location],
            :service_number => params[:service_number],
            :music_site => params[:music_site],
            :fortune_year => params[:fortune_year],
            :stock_event => params[:stock_event]
        )

        services = Service.where(:user_id => current_user.id).order("sequence ASC")
        8.times do |i|
            services[i].update(
                :id_service => params[:"widget_#{i+1}"],
                :size_x => params[:"sizex_#{i+1}"],
                :size_y => params[:"sizey_#{i+1}"]
            )
        end

        redirect_to "/"
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
