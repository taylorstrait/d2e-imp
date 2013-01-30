class Chapter < ActiveRecord::Base
  belongs_to :adventure
  belongs_to :quest

end
