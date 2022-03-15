# frozen_string_literal: true

require "spec_helper"

RSpec.describe Shiyo::SyntaxSugar do
  let(:target_module) { Module.new { extend Shiyo::SyntaxSugar } }
  let(:object) { instance_double(Shiyo::Specification) }

  before { allow(object).to receive(:to_shiyo).and_return(object) }

  describe "#Not" do
    it { expect(target_module::Not(object)).to be_a(Shiyo::Not) }
  end
end
