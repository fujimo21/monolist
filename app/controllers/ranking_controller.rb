class RankingController < ApplicationController

	def have
		have_ids = Have.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
		@haves = Item.find(have_ids)
	end
	
	def want
		want_ids = Have.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
		@wants = Item.find(want_ids)
	end
	
end
