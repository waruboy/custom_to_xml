# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

orders = Order.create([{
  purchase_order_no: 149135,
  order_type: "STANDARD",
  }])

party1 = {
      name: "Wendy Bledsoe",
      party_type: "SOLDTO",
      one_time: "1",
      partner_no: 9902,
      address1: "3 Tazewell St",
      address2: "",
      city: "Fredericksburg",
      state: "VA",
      zip_code: "22405",
      country: "usa"
    }
party2 = {
    name: "Wendy Bledsoe",
    party_type: "SHIPTO",
    one_time: "1",
    partner_no: 0001,
    address1: "3 Tazewell St",
    address2: "",
    city: "Fredericksburg",
    state: "VA",
    zip_code: "22405",
    country: "usa"
  }

order = orders.first
order.parties.create([party1, party2])

tag1 = {
  context: "Shipping Method",
  value: "Fedex"
}

tag2 = {
  context: "Sales Order Type",
  value: "Re-Order"
}

order.taggs.create [tag1, tag2]

item = {
  start_date: Date.strptime("2015-05-06", '%Y-%m-%d'),
  cancel_date: Date.strptime("2015-06-05", '%Y-%m-%d'),
  product_no: "SM-JSY-WHT-B",
  size1: "",
  upc: 889542028952,
  unit_price: 49.00,
  actual_price: 49.00,
  discount_percent: 0.00,
  order_qty: 1,
  ship_qty: 0,
  cancel_qty: 0
}

order.items.create item