class Poke
  # def self.poke(obj)
  #   new(obj).poke
  # end

  def initialize(obj)
    @object = obj
  end

  def poke
    my_methods = @object.methods - Object.methods
    my_ivars = @object.instance_variables
    my_object_id = @object.object_id

    {
      # Stuff about the object
      #
      object_id: my_object_id,
      instance_variables: my_ivars,
      total_num_available_methods: methods.count,

      # Stuff about its class
      #
      own_methods: my_methods,
      class_variables: @object.class.class_variables,

      class_name: @object.class,
      class_constants: @object.class.constants,

      # ignore ancestors - we just want info about this single class
      public_methods: @object.public_methods(false),
      protected_methods: @object.protected_methods(false),
      private_methods: @object.private_methods(false),

      class_ancestors: @object.class.ancestors,
    }
  end

  private

  # TODO: show constant values

  # def constants(names)
  #   h = {}
  #   names.each do |name|
  #     h[name] = @object.class.send
  #   end
  # end
end

def poke(obj)
  Poke.new(obj).poke
end
