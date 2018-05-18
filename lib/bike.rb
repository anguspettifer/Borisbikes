class Bike

  def initialize
    @condition = true
  end

  def working?
    @condition
  end

  def report_broken
    @condition = false
  end

end
