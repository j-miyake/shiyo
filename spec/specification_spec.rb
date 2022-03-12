# frozen_string_literal: true

require "spec_helper"

RSpec.describe Shiyo::Specification do
  let(:klass) { Class.new { include Shiyo::Specification } }
  let(:spec) { klass.new }
  let(:other) { klass.new }

  describe "#satisfied_by?" do
    it { expect { spec.satisfied_by?(anything) }.to raise_error(NotImplementedError) }
  end

  describe "#to_shiyo" do
    it { expect(spec.to_shiyo).to be(spec) }
  end

  describe "#and" do
    it { expect(spec.and(other)).to be_a(Shiyo::And) }
  end

  describe "#or" do
    it { expect(spec.or(other)).to be_a(Shiyo::Or) }
  end
end
