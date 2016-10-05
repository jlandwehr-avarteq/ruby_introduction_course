require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'default values' do
    subject { create(:task).status }

    it { is_expected.to eq('uncomplete') }
  end

  describe 'valid arguments' do
    subject { build(:task, description: nil) }

    it 'should allow an empty descriptions' do
      is_expected.to be_valid
    end

    it { expect(subject.title).not_to be_nil }
    it { is_expected.to be_valid }
  end

  describe 'invalid arguments' do
    subject { build(:invalid_task) }

    it { expect(subject.title).to be_nil }
    it { is_expected.to be_invalid }

    it 'should not be saved' do
      subject.save

      expect(Task.all).not_to include(subject)
    end

    it 'save should return an error array' do
      subject.save

      expect(subject.errors).not_to be_empty
      expect(subject.errors).to include(:title)
      expect(subject.errors[:title]).to eq([ "can't be blank" ])
    end
  end
end
