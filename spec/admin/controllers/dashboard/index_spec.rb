# frozen_string_literal: true

RSpec.describe Admin::Controllers::Dashboard::Index do
  subject { action.call(params) }

  let(:params) { {} }
  let(:action) { described_class.new(operation: operation) }

  context 'when operation is success' do
    let(:talks) { Fabricate.build_times(3, :talk) } # unapproved
    let(:operation) { ->(*) { Success(result: talks) } }

    it { expect(subject.first).to eq(200) }

    it 'exposes talks' do
      subject
      expect(action.talks).to eq(talks)
    end
  end

  context 'when operation is failure' do
    let(:talks) { Fabricate.build_times(3, :talk) } # unapproved
    let(:operation) { ->(*) { Failure(result: talks) } }

    it { expect(subject.first).to eq(400) }
  end

  context 'with real data' do
    let!(:talks) { Fabricate.times(3, :talk) }
    let(:action) { described_class.new }

    it { expect(subject.first).to eq(200) }

    it 'exposes talks' do
      subject
      expect(action.talks).to match_array(talks)
    end
  end
end
