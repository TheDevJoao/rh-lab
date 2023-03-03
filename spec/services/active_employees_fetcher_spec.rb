# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActiveEmployeesFetcher, type: :service do
  describe '#call' do
    let!(:john) { create(:employee, :with_active_employment) }
    let!(:jane) { create(:employee, :with_inactive_employment) }

    context 'when employed' do
      subject { described_class.new.call }

      it { is_expected.to include(john) }
    end

    context 'when not employed' do
      subject { described_class.new.call }

      it { is_expected.not_to include(jane) }
    end
  end
end
