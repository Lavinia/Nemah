require 'spec_helper'

describe Nemah::SpecificNeed::Salt do
  it_behaves_like 'a specific need' do
    let(:unit) { :g }
  end

  it_behaves_like 'a mineral' do
    let(:no_workload_min_need) { 27.03 }
    let(:light_workload_min_need) { 37.10 }
    let(:medium_workload_min_need) { 47.70 }
    let(:hard_workload_min_need) { 47.70 }
    let(:very_hard_workload_min_need) { 68.90 }
  end
end
