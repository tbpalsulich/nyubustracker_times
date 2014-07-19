class Stop < ActiveRecord::Base
    validates_uniqueness_of :stop_id
    def to_param
        stop_id
    end

    def self.find(input)
        find_by stop_id: input
    end
end
