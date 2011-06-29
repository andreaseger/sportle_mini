require 'spec_helper'

describe Schedule do
  it 'should autmaticaly parse a Time string into a time object' do
    Time.expects(:parse).with("2011-06-30T00:22:21+02:00").returns(Time.now)   #I dont care what date will be returned it just should not be nil
    schedule = Schedule.new
    schedule.created_at = "2011-06-30T00:22:21+02:00"
  end
  it 'should autmaticaly parse a date string into a date object' do
    Date.expects(:parse).with("2011-03-12").returns(Time.now.to_date)   #I dont care what date will be returned it just should not be nil
    schedule = Schedule.new
    schedule.date = "2011-03-12"
  end
  context '#missing field when loading' do
    it 'should not get an error if I try to set long_course to nil' do
      schedule = Schedule.new
      schedule.long_course = nil
    end
    it 'should not get an error if I try to set date to nil' do
      schedule = Schedule.new
      schedule.date = nil
    end
    it 'should not get an error if I try to set created_at to nil' do
      schedule = Schedule.new
      schedule.created_at = nil
    end
  end
end
