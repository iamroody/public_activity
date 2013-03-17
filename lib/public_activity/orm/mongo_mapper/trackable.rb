module PublicActivity
  module ORM
    module MongoMapper
      module Trackable
        def self.included(base)
          base.many :activities, :class_name => "::PublicActivity::Activity", :as => :trackable
        end
      end
    end
  end
end
