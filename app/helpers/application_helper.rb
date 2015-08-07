module ApplicationHelper
	def gravator_for(chef, options = { size: 80 })
		gravator_id = Digest::MD5::hexdigest(chef.email.downcase)
		size = options[:size]
		gravator_url = "http://www.gravatar.com/avatar/#{gravator_id}?s=#{size}"
		image_tag(gravator_url, alt: chef.chefname, class: "gravator")
	end
end
