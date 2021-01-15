class User < ApplicationRecord
    has_many :active_relationships, class_name: "Relationship"
    has_many :passive_relationships, class_name: "Relationship"
end
