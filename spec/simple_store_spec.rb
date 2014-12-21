require_relative 'spec_helper.rb'

describe SimpleStore do
  describe 'instance methods' do
    let(:subject_class) { Class.new(described_class) }

    subject { subject_class.new }

    describe "#save" do
      it 'stores the item on the class' do
        subject.save
        expect(subject_class.all).to include(subject)
      end
    end

    describe "#destroy" do
      before do
        subject_class.add(subject)
      end

      it 'removes the item from the class storage' do
        subject.destroy
        expect(subject_class.all).not_to include(subject)
      end
    end

    describe "#id" do
      before do
        subject_class.add(subject)
      end

      it 'returns the key that has been saved to in the collection' do
        expect(subject.id).to eq(1)
      end
    end

    describe 'class methods' do
      subject { Class.new(described_class) }

      describe '::all' do
        it 'should  be empty until something has been added' do
          expect(subject.all).to be_empty
        end
      end

      describe "::add" do
        let(:item) { double('Item') }

        it 'should store the item on the class' do
          subject.add(item)
          expect(subject.all).to include(item)
        end
      end

      describe "::create" do
        it 'should create a new item, store it into the class and return it' do
          new_item = subject.create
          expect(subject.all).to include(new_item)
        end
      end

      describe '::get' do
        let(:item1) { double('Item') }
        let(:item2) { double('Item') }

        before do
          subject.add(item1)
          subject.add(item2)
        end

        it 'should get an existing item and return it' do
          expect(subject.get(1)).to eq(item1)
          expect(subject.get(2)).to eq(item2)
        end
      end

      describe '::items' do
        it 'initializes to an empty Hash' do
          expect(subject.items).to be_a(Hash).and be_empty
        end

        it 'memoizes the store across the accesses' do
          expect(subject.items).to be(subject.items)
        end

        it 'contains saved instances' do
          item = subject.new
          item.save
          expect(subject.all).to include(item)
        end
      end
    end
  end
end
