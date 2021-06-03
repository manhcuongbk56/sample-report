class Application < ApplicationRecord
  self.table_name = 'application'
  has_many :installed_devices, foreign_key: :key
end
