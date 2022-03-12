# frozen_string_literal: true

require "spec_helper"

RSpec.describe Shiyo::Not do
  it_behaves_like "shiyo specification class"

  describe "#satisfied_by?" do
    let(:candidate) { double }
    let(:wrapped) { instance_double(Shiyo::Specification) }
    let(:spec) { Shiyo::Not.new(wrapped) }

    before do
      allow(wrapped).to receive(:to_shiyo).and_return(wrapped)
    end

    context "when the given candidate satisfies the wrapped specification" do
      before do
        allow(wrapped).to receive(:satisfied_by?).with(candidate).and_return(true)
      end
      it { expect(spec.satisfied_by?(candidate)).to be(false) }
    end

    context "when the given candidate does not satisfy the wrapped specification" do
      before do
        allow(wrapped).to receive(:satisfied_by?).with(candidate).and_return(false)
      end
      it { expect(spec.satisfied_by?(candidate)).to be(true) }
    end
  end
end
