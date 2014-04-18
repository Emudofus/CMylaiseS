class Guild < ActiveRecord::Base
	set_table_name "gremios"

	alias_attribute :name, :nombre
	alias_attribute :level, :nivel
end