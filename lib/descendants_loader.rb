require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/class/subclasses'

path = File.expand_path(File.dirname(__FILE__))
Dir["#{path}/descendants_loader/**/*.rb"].each do |file|
  require file
end

#
# Descendants loader. Please check out README for a full introduction.
#
module DescendantsLoader
  #
  # If the module is included it is forced to be extended.
  # Usage:
  #   require 'descendants_loader'
  #   class MyClass
  #     include DescendantsLoader
  #
  #     ...
  #   end
  #
  def self.included(base)
    base.extend(ClassMethods)
  end

  #
  # Definition of class methods.
  #
  module ClassMethods
    #
    # Overwrites Object.descendants injecting an autoload process.
    #
    def descendants
      if (classes = super).empty?
        load_self_descendants
        classes = super
      end

      classes
    end

    #
    # Overwrites Object.subclasses injecting an autoload process.
    #
    def subclasses
      if (classes = super).empty?
        load_self_descendants
        classes = super
      end

      classes
    end

    private

    #
    # Find and load all ruby files under the same directory structure
    # of the declared class which is including DescendantsLoader module.
    #
    # This is the trick to put the classes into ObjectSpace and have the
    # desired behavior of Object.descendants and Object.subclasses.
    #
    def load_self_descendants
      file = ClassFinder.where_is(self)
      path = File.expand_path(File.dirname(file))
      Dir["#{path}/**/*.rb"].each { |f| load f }
    end
  end
end
