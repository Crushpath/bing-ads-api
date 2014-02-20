# -*- encoding : utf-8 -*-

module BingAdsApi
	
	##
	# Public : Defines the set of accounts and campaigns to include in the report.
	# 
	# Reference: http://msdn.microsoft.com/en-US/library/bing-ads-reporting-accountthroughcampaignreportscope.aspx
	# 
	# Author:: jlopezn@neonline.cl 
	class AccountThroughCampaignReportScope < BingAdsApi::DataObject
		
		attr_accessor :account_ids, :campaigns
		
	end
	
end