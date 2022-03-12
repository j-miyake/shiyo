# frozen_string_literal: true

shared_examples_for "shiyo specification class" do
  it { expect(described_class.instance_methods).to include(:satisfied_by?) }
  it { expect(described_class.instance_methods).to include(:to_shiyo) }
end
