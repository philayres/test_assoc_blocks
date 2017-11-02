class Item < ApplicationRecord
  belongs_to :master

  before_create -> {
    self.description1 = self.class.where(master_id: nil).to_sql
    self.description2 = self.class.unscoped.where(master_id: nil).to_sql
  }


end
