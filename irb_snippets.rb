puts "Loading Custom Snippets: oi_assoc_dump"
# Dump association info for the given ActiveModel
def oi_assoc_dump(model)
  model.reflect_on_all_associations.map {|r| { points_at: r.class_name, macro: r.macro, name: r.name, options: r.options } }
end
