# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DepartmentsGetter do
  describe '#call' do
    context 'when departments are present' do
      subject { DepartmentsGetter.new.call }

      let!(:hr) { create(:department, name: 'HR') }
      let!(:engineering) { create(:department, name: 'Engineering') }

      it 'returns the departments' do
        expect(subject).to include(hr).and include(engineering)
      end

      it 'returns the correct names' do
        expect(hr.name).to include('HR')
        expect(engineering.name).to include('Engineering')
      end
    end

    context 'when departments are not present' do
      subject { DepartmentsGetter.new.call }

      it 'returns an empty array' do
        expect(subject).to be_empty
      end
    end
  end
end
