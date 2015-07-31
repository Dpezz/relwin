module PermissionsConcern
	extend ActiveSupport::Concern

	def is_vendor?
		self.permission_level >= 0
	end

	def is_terminal?
		self.permission_level >= 1
	end

	def is_vendor_terminal?
		self.permission_level >= 2
	end

	def is_admin?
		self.permission_level >= 3
	end

	def is_super_admin?
		self.permission_level >= 4
	end
end