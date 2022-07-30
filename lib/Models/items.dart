class Items {
  String? product;
  String? business;
  int? id;
  // List failure;

  Items({this.product, this.business, this.id});

  Items.fromJson(Map<String, dynamic> json) {
    product = json["product_name"];
    business = json["business_name"];
    id = json["sku_id"];
    // failure = json["failure_reasons"];
  }
}
// class Items {
//   int? id;
//   String? product;
//   String? business;
//   String? failure;
//
//   Items({this.id, this.product, this.business, this.failure});
//
//   Items.fromJson(Map<String, dynamic> json) {
//     id = json['sku_id'];
//     product = json['product_name'];
//     business = json['business_name'];
//     failure = json['failure_reasons'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['sku_id'] = this.id;
//     data['product_name'] = this.product;
//     data['business_name'] = this.business;
//     data['failure_reasons'] = this.failure;
//     return data;
//   }
// }
