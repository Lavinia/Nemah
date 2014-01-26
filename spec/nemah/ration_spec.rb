require 'spec_helper'

shared_examples_for 'a nutrient requirement' do
  it "returns true when the horse's nutrient need is met" do
    expect(ration.public_send("enough_#{nutrient}?")).to be_true
  end

  it 'returns false when the nutrient need is not met' do
    expect(ration(0.1).public_send("enough_#{nutrient}?")).to be_false
  end

  def ration(modifier = 0)
    nutrient_need = double(nutrient.to_s, min: nutrient_min + modifier, unit: nutrient_unit)
    need = double('need', nutrient => nutrient_need)
    fodder_list = Nemah::FodderList.new(fodders)
    ration = Nemah::Ration.new(need, fodder_list)
  end
end

describe Nemah::Ration do
  describe '#enough_calcium?' do
    it_behaves_like 'a nutrient requirement' do
      let(:nutrient) { :calcium }
      let(:nutrient_min) { 35.6 }
      let(:nutrient_unit) { :g }
      let(:fodders) { { Nemah::Fodder.new('hay', { nutrient => 3.56 }) => 10 } }
    end
  end

  describe '#enough_energy?' do
    it_behaves_like 'a nutrient requirement' do
      let(:nutrient) { :energy }
      let(:nutrient_min) { 65 }
      let(:nutrient_unit) { :MJ }
      let(:fodders) { { Nemah::Fodder.new('hay', { nutrient => 6.5 }) => 10 } }
    end
  end

  describe '#enough_magnesium?' do
    it_behaves_like 'a nutrient requirement' do
      let(:nutrient) { :magnesium }
      let(:nutrient_min) { 25 }
      let(:nutrient_unit) { :g }
      let(:fodders) { { Nemah::Fodder.new('hay', { nutrient => 2.5 }) => 10 } }
    end
  end

  describe '#enough_phosphor?' do
    it_behaves_like 'a nutrient requirement' do
      let(:nutrient) { :phosphor }
      let(:nutrient_min) { 24.4 }
      let(:nutrient_unit) { :g }
      let(:fodders) { { Nemah::Fodder.new('hay', { nutrient => 2.44 }) => 10 } }
    end
  end

  describe '#enough_protein?' do
    it_behaves_like 'a nutrient requirement' do
      let(:nutrient) { :protein }
      let(:nutrient_min) { 330 }
      let(:nutrient_unit) { :g }
      let(:fodders) { { Nemah::Fodder.new('hay', { nutrient => 33 }) => 10 } }
    end
  end

  describe '#enough_salt?' do
    it_behaves_like 'a nutrient requirement' do
      let(:nutrient) { :salt }
      let(:nutrient_min) { 7.8 }
      let(:nutrient_unit) { :g }
      let(:fodders) { { Nemah::Fodder.new('hay', { nutrient => 0.78 }) => 10 } }
    end
  end

  describe '#enough_selenium?' do
    it_behaves_like 'a nutrient requirement' do
      let(:nutrient) { :selenium }
      let(:nutrient_min) { 12.1 }
      let(:nutrient_unit) { :mg }
      let(:fodders) { { Nemah::Fodder.new('hay', { nutrient => 1.21 }) => 10 } }
    end
  end

  describe '#enough_solids?' do
    it_behaves_like 'a nutrient requirement' do
      let(:nutrient) { :solids }
      let(:nutrient_min) { 7 }
      let(:nutrient_unit) { :kg }
      let(:fodders) { { Nemah::Fodder.new('hay', { nutrient => 70 }) => 10 } }
    end
  end
end