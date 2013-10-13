require 'spec_helper'

describe Nemah::Workload do
  it 'can have the amount of walking set' do
    expect(workload_with(walk: 30).walk).to eq(30)
  end

  it 'can have the amount of trot and canter set' do
    expect(workload_with(trot_and_canter: 5).trot_and_canter).to eq(5)
  end

  it 'can have the number of days of exercise per week set' do
    expect(workload_with(days_per_week: 3).days_per_week).to eq(3)
  end

  it 'is equal to another workload with the same amount of work' do
    workload = workload_with(walk: 30, trot_and_canter: 5, days_per_week: 3)
    another_workload = workload_with(walk: 30, trot_and_canter: 5, days_per_week: 3)
    expect(workload).to eq(another_workload)
  end

  private

  def workload_with(args)
    Nemah::Workload.new(args)
  end
end
