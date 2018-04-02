# Class connecting to mongo
class Record
  def find_nested(nested_collection, query)
    # TODO: Improve querying on Mongoid sub-collections
    (send(nested_collection).select do |record|
      (query.to_a - record.attributes.keys.reduce({}) do |prev, k|
        prev.merge(k => record.attributes[k].to_s)
      end.to_a).empty?
    end)
  end

  def find_nested_one(nested_collection, query)
    selffind_nested(nested_collection, query).first
  end
end
