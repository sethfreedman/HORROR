class Comment < ActiveRecord::Base

	def by_whom
		if author == "seth"
		else
		end
	end
	
	def good
		if rating > 3
			"good"
		else
			"not good"
			
		end
	end

end
