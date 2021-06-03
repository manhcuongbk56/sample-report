class InstalledDevice < ApplicationRecord



  self.table_name = 'installed_device'
  belongs_to :application, foreign_key: :application_key
end
