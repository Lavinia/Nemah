require 'spec_helper'

describe Nemah::SpecificNeed::Phosphor do
  it_behaves_like 'a specific need'

  it_behaves_like 'a mineral' do
    let(:no_workload_min_need) { 14.84 }
    let(:light_workload_min_need) { 19.08 }
    let(:medium_workload_min_need) { 22.26 }
    let(:hard_workload_min_need) { 30.74 }
    let(:very_hard_workload_min_need) { 30.74 }
  end
end
