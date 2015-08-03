class SimtagsController < ApplicationController

		def tagsimvol

	 @newsimvol = simvol_params.newsimvol
	 Simvol.create(:name => @newsimvol)
	 @simvol.tags << Simvol.find_by_name(@newsimvol)

	end

end
