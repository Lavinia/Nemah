require 'spec_helper'

describe Nemah::SpecificNeed::Magnesium do
  it_behaves_like 'a specific need' do
    let(:unit) { :g }
  end

  it_behaves_like 'a mineral' do
    let(:no_workload_min_need) { 7.95 }
    let(:light_workload_min_need) { 10.07 }
    let(:medium_workload_min_need) { 12.19 }
    let(:hard_workload_min_need) { 15.9 }
    let(:very_hard_workload_min_need) { 15.9 }
  end
end
