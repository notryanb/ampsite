class Datasheet < ActiveRecord::Base
  belongs_to :datasheetable, polymorphic: true
end