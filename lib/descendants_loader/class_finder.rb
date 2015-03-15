module DescendantsLoader
  class ClassFinder
    class << self
      def where_is(klass)
        find_related_source_files(klass).each do |f|
          return f if class_and_source_eq?(klass, f)
        end

        nil
      end

      def class_name_from_path(path)
        ary = path.split('/')
        ary.map! { |s| s.gsub(/\.rb/, '') }

        index = ary.index('models') ||
          ary.index('workers') ||
          ary.index('helpers') ||
          ary.index('controllers') ||
          ary.index('mailers') ||
          ary.index('lib')
        ary.slice!(0, index + 1)

        ary.map(&:camelize).join('::')
      end

      private

      def find_related_source_files(klass)
        locations = list_methods(klass).map(&:source_location)

        locations.compact.map(&:first)
      end

      def list_methods(klass)
        list_class_methods(klass) +
          list_instance_methods(klass) +
          list_private_methods(klass)
      end

      def list_class_methods(klass)
        klass.methods(false).map { |m| klass.method(m) }
      end

      def list_instance_methods(klass)
        klass.instance_methods(false).map { |m| klass.instance_method(m) }
      end

      def list_private_methods(klass)
        klass.new.private_methods(false).map { |m| klass.instance_method(m) }
      end

      def class_and_source_eq?(klass, file)
        class_name_from_path(file) == klass.to_s
      end
    end
  end
end
