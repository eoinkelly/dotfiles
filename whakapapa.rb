class Whakapapa
  def initialize(obj)
    @object = obj
  end

  ##
  # get only the methods defined on the class object itself
  def unique_methods_for(klass)
    ancestor_methods = klass.ancestors.drop(1).flat_map(&:methods)
    klass.methods - ancestor_methods
  end

  def examine
    klass = @object.is_a?(Class) ? @object : @object.class
    ancestors = klass.ancestors
    prefix = "WHAKAPAPA:"

    puts "#{prefix} #{@object} is a #{klass}"

    ancestors.each do |kls|
      puts "#{prefix} #{kls}: #{kls.methods.count} methods total"
      puts "#{prefix} #{unique_methods_for(kls).inspect}"
    end
    nil
    # my_methods = @object.methods - Object.methods
    # my_ivars = @object.instance_variables
    # my_object_id = @object.object_id
    #
    # {
    #   # Stuff about the object
    #   #
    #   object_id: my_object_id,
    #   instance_variables: my_ivars,
    #   total_num_available_methods: methods.count,
    #
    #   # Stuff about its class
    #   #
    #   own_methods: my_methods,
    #   class_variables: @object.class.class_variables,
    #
    #   class_name: @object.class,
    #   class_constants: @object.class.constants,
    #
    #   # ignore ancestors - we just want info about this single class
    #   public_methods: @object.public_methods(false),
    #   protected_methods: @object.protected_methods(false),
    #   private_methods: @object.private_methods(false),
    #
    #   class_ancestors: @object.class.ancestors,
    # }
  end

  private
end

def whakapapa(obj)
  Whakapapa.new(obj).examine
end
