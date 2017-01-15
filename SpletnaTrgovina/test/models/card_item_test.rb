require File.expand_path("../../test_helper", __FILE__)

class CardItemTest < ActiveSupport::TestCase
  def setup
    @item = CardItem.new(user_id: 1, record_id: 1)
  end

   test "should_not_save_record_twice" do
     @item.save
     assert !@item.save
   end
end
