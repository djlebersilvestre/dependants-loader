require 'active_support/core_ext/string/inflections'

path = File.expand_path(File.dirname(__FILE__))
Dir["#{path}/descendants_loader/**/*.rb"].each do |file|
  require file
end

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

    private

    def load_self_descendants
      file = ClassFinder.where_is(self)
      path = File.expand_path(File.dirname(file))
      Dir["#{path}/**/*.rb"].each { |f| load f }
    end
  end
end
