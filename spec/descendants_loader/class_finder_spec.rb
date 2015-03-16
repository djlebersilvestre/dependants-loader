module DescendantsLoader
  describe ClassFinder do
    subject { ClassFinder }

    describe '.where_is' do
      it 'returns ClassFinder file path' do
        file_path = File.expand_path(__FILE__)
                    .gsub(/\/spec/, '/lib')
                    .gsub(/_spec/, '')

        expect(subject.where_is(ClassFinder)).to eq(file_path)
      end

      it 'returns nil if the class does not exists in project file tree' do
        expect(subject.where_is(ArgumentError)).to be_nil
      end
    end

    describe '.class_name_from_path' do
      let(:base_path) { '/a/b/c/prj' }

      it 'fails if there is no mapped dirs in the given path' do
        expect do
          subject.class_name_from_path(base_path)
        end.to raise_error(ArgumentError)
      end

      %w(lib models workers schedulers controllers mailers).each do |dir|
        let(:path) { [base_path, dir, ''].join('/') }

        it "returns not nil for #{dir}" do
          expect(subject.class_name_from_path(path)).not_to be_nil
        end

        it "returns camelized single name in #{dir}" do
          file_path = path + 'classname.rb'

          expect(subject.class_name_from_path(file_path)).to eq('Classname')
        end

        it "returns camelized composed name #{dir}" do
          file_path = path + 'class_name.rb'

          expect(subject.class_name_from_path(file_path)).to eq('ClassName')
        end

        it "returns camelized composed name with modules in #{dir}" do
          file_path = path + 'module_a/module_b/class_name.rb'
          class_name = 'ModuleA::ModuleB::ClassName'

          expect(subject.class_name_from_path(file_path)).to eq(class_name)
        end
      end
    end
  end
end
