require 'mongo_mapper'

module PublicActivity
  module ORM
    module MongoMapper
      # The ActiveRecord model containing
      # details about recorded activity.
      class Activity
        include ::MongoMapper::Document
        include Renderable

        # Define polymorphic association to the parent
        belongs_to :trackable,  polymorphic: true
        # Define ownership to a resource responsible for this activity
        belongs_to :owner,      polymorphic: true
        # Define ownership to a resource targeted by this activity
        belongs_to :recipient,  polymorphic: true

        key :key, String
        key :parameters,  type: Hash

        timestamps!
      end
    end
  end
end
