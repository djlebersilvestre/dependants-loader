require 'class_finder'
require 'version'

module DescendantsLoader
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def descendants
      if (classes = super).empty?
        load_self_descendants
        classes = super
      end

      classes
    end

    def subclasses
      if (classes = super).empty?
        load_self_descendants
        classes = super
      end

      classes
    end

    def load_self_descendants
      file = ClassFinder.where_is(self)
      path = File.expand_path(File.dirname(file))
      Dir["#{path}/**/*.rb"].each { |f| load f }
    end
  end
end
