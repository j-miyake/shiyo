# frozen_string_literal: true

require "spec_helper"

RSpec.describe Shiyo::Conversion do
  let(:target_module) { Module.new { extend Shiyo::Conversion } }
  let(:object) { instance_double(Shiyo::Specification) }

  before { allow(object).to receive(:to_shiyo).and_return(object) }

  describe "#Specification" do
    context "when a Shiyo compatible object is given" do
      it { expect(target_module::Specification(object)).to be(object) }
    end
    context "when a Shiyo incompatible object is given" do
      it { expect { target_module::Specification(Object.new) }.to raise_error(Shiyo::Error::IncompatibleObject) }
    end
  end
end
