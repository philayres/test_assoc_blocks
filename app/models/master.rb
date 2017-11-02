class Master < ApplicationRecord

  has_many :items,  inverse_of: :master do
    def build att=nil
      item = self.new(master: proxy_association.owner)      
      item.description1 = self.where(master_id: nil).to_sql
      item.description2 = self.unscoped.where(master_id: nil).to_sql
      item
    end
  end

end
