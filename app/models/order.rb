class Order < ActiveRecord::Base

	has_and_belongs_to_many :parties
	has_and_belongs_to_many :taggs
	has_and_belongs_to_many :items

	def to_auto_xml
		excepted_attributes = [:id, :created_at, :updated_at]
		hash = self.as_json(
			except: excepted_attributes,
			include: {
				parties: {
					except: excepted_attributes
				},
				items: {
					except: excepted_attributes
				},
				taggs: {
					except: excepted_attributes
				}
			})
		hash["items"].each do |item|
			item["unit_price"] = "%.02f" % item["unit_price"]
		end
		hash.deep_transform_keys!{ |key| key.to_s.camelize(:lower) }
		hash.to_tau_xml(skip_types: true, root: "order", tags_label: "taggs")
	end

	def to_manual_xml
		hash = {
			purchaseOrderNo: purchase_order_no,
			orderType: order_type,
			parties: {},
			items: {},
			taggs: {}
		}
		parties_array = []
		parties.each do |p|
			p_hash = {
				name: p.name,
				partyType: p.party_type,
				oneTime: p.one_time,
				partnerNo: p.partner_no,
				address1: p.address1,
				address2: p.address2,
				city: p.city,
				state: p.state,
				zipCode: p.zip_code,
				country: p.country
			}
			parties_array << p_hash
		end
		hash["parties"] = parties_array

		items_array = []
		items.each do |i|
			i_hash = {
				startDate: i.start_date,
				cancelDate: i.cancel_date,
				productNo: i.product_no,
				size1: i.size1,
				upc: i.upc,
				unitPrice: "%.02f" % i.unit_price,
				actualPrice: "%.02f" % i.actual_price,
				discountPercent: "%.02f" % i.discount_percent,
				orderQty: i.order_qty,
				shipQty: i.ship_qty,
				cancelQty: i.cancel_qty
			}
			items_array << i_hash
		end
		hash["items"] = items_array

		taggs_array = []
		taggs.each do |t|
			t_hash = {
				"context" => t.context,
				"value" => t.value
			}
		taggs_array << t_hash
		end
		hash["taggs"] = taggs_array

		hash.to_tau_xml(skip_types: true, root: "order", tags_label: "taggs")
	end
end
