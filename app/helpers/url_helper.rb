module UrlHelper
	def to_url(url)
		/^http/i.match(url) ? url : "http://#{url}"
	end
end