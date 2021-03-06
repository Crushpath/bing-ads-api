# -*- encoding : utf-8 -*-

module BingAdsApi

	##
	# Public : Defines the base object of an ad.
	# Do not instantiate this object. Instead you can instantiate the
	# BingAdsApi::TextAd, BingAdsApi::MobileAd, or BingAdsApi::ProductAd
	# object that derives from this object.
	#
	# Reference: http://msdn.microsoft.com/en-US/library/bing-ads-campaign-management-ad.aspx
	#
	# Author:: jlopezn@neonline.cl
	#
	class Ad < BingAdsApi::DataObject
		include BingAdsApi::AdEditorialStatus
		include BingAdsApi::AdStatus
		include BingAdsApi::AdType


		attr_accessor :id,
			:device_preference,
			:editorial_status,
			:status,
			:type

		private

			# Internal: Retrieve the ordered array of keys corresponding to this data
			# object.
			#
			# Author: alex.cavalli@offers.com
			def get_key_order
				super.concat(BingAdsApi::Config.instance.
					campaign_management_orders['ad'])
			end

	end

	##
	# Public : Defines a text ad.
	#
	# Reference: http://msdn.microsoft.com/en-US/library/bing-ads-campaign-management-textad.aspx
	#
	# Author:: jlopezn@neonline.cl
	#
	class TextAd < BingAdsApi::Ad

		attr_accessor :destination_url,
			:display_url,
			:text,
			:title

		# Public : Specification of DataObject#to_hash method that ads the type attribute based on this specific class
		#
		# Author:: jlopezn@neonline.cl
		#
		# keys - specifies the keys case
		#
		# Returns:: Hash
		def to_hash(keys = :underscore)
			hash = super(keys)
			hash[:'@xsi:type'] = "#{ClientProxy::NAMESPACE}:TextAd"
			return hash
		end

		private

			# Internal: Retrieve the ordered array of keys corresponding to this data
			# object.
			#
			# Author: alex.cavalli@offers.com
			def get_key_order
				super.concat(BingAdsApi::Config.instance.
					campaign_management_orders['text_ad'])
			end

	end


	##
	# Public : Defines a mobile ad. A mobile ad is displayed to a user
	# when the ad is viewed on a low-fi mobile device.
	#
	# Reference: http://msdn.microsoft.com/en-US/library/bing-ads-campaign-management-mobilead.aspx
	#
	# Author:: jlopezn@neonline.cl
	#
	class MobileAd < BingAdsApi::Ad

		attr_accessor :business_name,
			:destination_url,
			:display_url,
			:phone_number,
			:text,
			:title

		# Public : Specification of DataObject#to_hash method that ads the type attribute based on this specific class
		#
		# Author:: jlopezn@neonline.cl
		#
		# keys - specifies the keys case
		#
		# Returns:: Hash
		def to_hash(keys = :underscore)
			hash = super(keys)
			hash[:'@xsi:type'] = "#{ClientProxy::NAMESPACE}:MobileAd"
			return hash
		end

		private

			# Internal: Retrieve the ordered array of keys corresponding to this data
			# object.
			#
			# Author: alex.cavalli@offers.com
			def get_key_order
				super.concat(BingAdsApi::Config.instance.
					campaign_management_orders['mobile_ad'])
			end

	end


	##
	# Public : Defines a product ad.
	#
	# Reference: http://msdn.microsoft.com/en-US/library/bing-ads-productad-campaign-management.aspx
	#
	# Author:: jlopezn@neonline.cl
	#
	class ProductAd < BingAdsApi::Ad

		attr_accessor :promotional_text

		# Public : Specification of DataObject#to_hash method that ads the type attribute based on this specific class
		#
		# Author:: jlopezn@neonline.cl
		#
		# keys - specifies the keys case
		#
		# Returns:: Hash
		def to_hash(keys = :underscore)
			hash = super(keys)
			hash[:'@xsi:type'] = "#{ClientProxy::NAMESPACE}:ProductAd"
			return hash
		end

		private

			# Internal: Retrieve the ordered array of keys corresponding to this data
			# object.
			#
			# Author: alex.cavalli@offers.com
			def get_key_order
				super.concat(BingAdsApi::Config.instance.
					campaign_management_orders['product_ad'])
			end

	end

end
