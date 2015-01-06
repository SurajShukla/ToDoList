require_relative 'spec_helper.rb'

describe Task do 
  subject { described_class.new(description: "Feed the cat") }

  describe '#to_s' do
    it "returns the value of the task's description" do
      expect(subject.to_s).to eq('Feed the cat')
    end
  end

  describe '::list_tasks' do
    let!(:task1) { Task.create(description: "Feed the Dog") }
    let!(:task2) { Task.create(description: "Feed the Cat") }
    let!(:task3) { Task.create(description: "Get Eggs") }
    let!(:task4) { Task.create(description: "Cook the Fish") }

    context 'when page number is 1' do
      it 'gives first 2 tasks' do
        expect(described_class.list_tasks(1, 2)).to match_array([task1, task2])
      end
    end

    context 'when page number is 2' do
      it 'gives last 2 tasks' do
        expect(described_class.list_tasks(2, 2)).to eq([task3, task4])
      end
    end
  end
end
