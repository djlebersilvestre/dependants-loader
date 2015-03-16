describe DescendantsLoader do
  examples_path = "#{File.expand_path(File.dirname(__FILE__))}/examples"
  context 'dumb' do
    require "#{examples_path}/dumb/lib/dumb_base.rb"

    describe '.descendants' do
      it 'cannot find inherited classes' do
        expect(DumbBase.descendants).to be_empty
      end
    end

    describe '.subclasses' do
      it 'cannot find inherited classes' do
        expect(DumbBase.subclasses).to be_empty
      end
    end
  end

  context 'smart' do
    require "#{examples_path}/smart/lib/smart_base.rb"

    describe '.descendants' do
      it 'finds SonA, SonB and SonC' do
        sons = %w(SmartSonA SmartSonB SmartSonC)
        expect(SmartBase.descendants.map(&:to_s)).to match_array(sons)
      end
    end

    describe '.subclasses' do
      it 'finds SonA and SonB' do
        sons = %w(SmartSonA SmartSonB)
        expect(SmartBase.subclasses.map(&:to_s)).to match_array(sons)
      end
    end
  end
end
