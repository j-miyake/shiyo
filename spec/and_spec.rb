# frozen_string_literal: true

require "spec_helper"

RSpec.describe Shiyo::And do
  it_behaves_like "shiyo specification class"

  describe "#satisfied_by?" do
    let(:candidate) { double }
    let(:one) { instance_double(Shiyo::Specification) }
    let(:other) { instance_double(Shiyo::Specification) }
    let(:spec) { Shiyo::And.new(one, other) }

    before do
      allow(one).to receive(:to_shiyo).and_return(one)
      allow(other).to receive(:to_shiyo).and_return(other)
    end

    context "when the given candidate satisfies both" do
      before do
        allow(one).to receive(:satisfied_by?).with(candidate).and_return(true)
        allow(other).to receive(:satisfied_by?).with(candidate).and_return(true)
      end
      it { expect(spec.satisfied_by?(candidate)).to be(true) }
    end

    context "when the given candidate satisfies the one but does not satisfy the other" do
      before do
        allow(one).to receive(:satisfied_by?).with(candidate).and_return(true)
        allow(other).to receive(:satisfied_by?).with(candidate).and_return(false)
      end
      it { expect(spec.satisfied_by?(candidate)).to be(false) }
    end

    context "when the given candidate does not satisfy the one but satisfies the other" do
      before do
        allow(one).to receive(:satisfied_by?).with(candidate).and_return(false)
        allow(other).to receive(:satisfied_by?).with(candidate).and_return(true)
      end
      it { expect(spec.satisfied_by?(candidate)).to be(false) }
    end

    context "when the given candidate does not satisfy both" do
      before do
        allow(one).to receive(:satisfied_by?).with(candidate).and_return(false)
        allow(other).to receive(:satisfied_by?).with(candidate).and_return(false)
      end
      it { expect(spec.satisfied_by?(candidate)).to be(false) }
    end
  end
end
