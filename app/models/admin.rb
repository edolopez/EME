class Admin < ActiveRecord::Base
  has_one :usuario, :as => :datos
end

