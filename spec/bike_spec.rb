require 'bike.rb'

describe Bike do
  it "is the bike working" do
    bike = Bike.new
    expect(bike.working?).to eq true
  end
  
  it 'can report if broken' do
    expect(subject.report_broken).to be_truthy
  end
end