class Stop < ActiveRecord::Base
    validates_uniqueness_of :stop_id
    serialize :times, JSON
    def to_param
        stop_id
    end

    def self.find(input)
        find_by stop_id: input
    end
end
