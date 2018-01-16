class Service < ActiveRecord::Base
    belongs_to :user
    before_save :default_values

    def default_values
        self.position_x ||= ((self.sequence-1)/4)*2+1;
        self.position_y ||= (self.sequence-1)%4+1;
        if self.sequence <= 4
            self.size_x ||= 2
        elsif
            self.size_x ||= 1
        end
        self.size_y ||= 1;
    end
end
