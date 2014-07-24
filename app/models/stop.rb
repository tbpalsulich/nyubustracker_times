class Stop < ActiveRecord::Base
    validates_uniqueness_of :stop_id
    has_many :bus_times, dependent: :destroy
    serialize :times_json, JSON
end
