require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:each) do
    @task = create(:task)
  end

  it 'should be uncomplete on default' do
    expect(@task.status).to eq('uncomplete')
  end

# it 'should only allow complete and uncomplete as status' do
#    expect(build(:task, status: 'invalid')).to be_invalid
#  end

  it 'should allow an empty descriptions' do
    task = build(:task, description: nil)
    expect(task).to be_valid
  end

  it 'should not allow empty titles' do
    task = build(:task, title: nil)
    expect(task).to be_invalid
  end
end
