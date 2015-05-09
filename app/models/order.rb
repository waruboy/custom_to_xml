class Order < ActiveRecord::Base
	def to_tau_xml
		hash = self.as_json(except: [:id, :created_at, :updated_at])
		hash.transform_keys!{ |key| key.to_s.camelize(:lower) }
		hash.to_tau_xml(skip_types: true)
	end
end
