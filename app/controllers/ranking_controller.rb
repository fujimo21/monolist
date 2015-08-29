class RankingController < ApplicationController
	before_action :set_count
	
	def have
		have_ids = Have.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
		@haves = Item.find(have_ids).index_by(&:id).slice(*have_ids).values
	end
	
	def want
		want_ids = Want.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
		@wants = Item.find(want_ids).index_by(&:id).slice(*want_ids).values
	end
	
	private
	
	def set_count
		@count = 0
	end
end