require File.expand_path("../../test_helper", __FILE__)
require 'open-uri'

class RecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end



  test "should_not_save_record_without_artist" do
    record = Record.new :image => File.new(Rails.root + 'public/defaultPL.png')
    record.album = "album"
    record.price = 12.4

    assert !record.save
  end

  test "should_not_save_record_without_price" do
    record = Record.new :image => File.new(Rails.root + 'public/defaultPL.png')
    record.album = "album"
    record.artist = "artist"

    assert !record.save
  end

  test "should_not_save_record_without_album" do
    record = Record.new :image => File.new(Rails.root + 'public/defaultPL.png')
    record.price = 12.4
    record.artist = "artist"
    assert !record.save
  end

  test "should_not_save_record_image_that is not_jpg/png" do
    record = Record.new :image => File.new(Rails.root + 'public/404.html')
    record.price = 12.4
    record.artist = "artist"
    record.album = "album"
    assert !record.save
  end

  test "should_save_record" do
    record = Record.new :image => File.new(Rails.root + 'public/defaultPL.png')
    record.price = 12.4
    record.artist = "artist"
    record.album = "album"
    assert record.save
  end

end
