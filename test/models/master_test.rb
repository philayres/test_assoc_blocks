require 'test_helper'

class MasterTest < ActiveSupport::TestCase

  test "master build outside association works as expected" do

    m = Master.create! name: 'Bob'
    item = Item.create master: m, name: 'Wall'

    puts "Master: #{m}"
    puts "self.where(master_id: nil).to_sql"
    puts item.description1
    puts "self.unscoped.where(master_id: nil).to_sql"
    puts item.description2

    # Flawed understanding would expect the queries to be the same
    assert item.description1 == item.description2
  end

  test "master association blocks add an unexpected scope" do

    m = Master.create! name: 'Bob'
    item = m.items.build name: 'Wall'

    puts "Master: #{m}"
    puts "self.where(master_id: nil).to_sql"
    puts item.description1
    puts "self.unscoped.where(master_id: nil).to_sql"
    puts item.description2

    # Flawed understanding would expect the queries to be the same
    assert item.description1 == item.description2
  end
end
