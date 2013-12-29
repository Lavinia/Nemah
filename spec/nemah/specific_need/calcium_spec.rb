require 'spec_helper'

describe Nemah::SpecificNeed::Calcium do
  it_behaves_like 'a specific need' do
    let(:unit) { :g }
  end

  it_behaves_like 'a mineral' do
    let(:no_workload_min_need) { 21.20 }
    let(:light_workload_min_need) { 31.80 }
    let(:medium_workload_min_need) { 37.10 }
    let(:hard_workload_min_need) { 42.40 }
    let(:very_hard_workload_min_need) { 42.40 }
  end
end
