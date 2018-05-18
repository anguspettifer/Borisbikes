require 'bike'

describe Bike do 

  it {is_expected.to respond_to(:working?)}

  it "checks condition of bike" do
    expect(subject.working?).to be true
  end

  it "returns false condition when bike is broken" do
    subject.report_broken
    expect(subject.working?).to be false
  end

end
