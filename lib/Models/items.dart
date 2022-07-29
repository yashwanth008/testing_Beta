class Items{
  String? product_name;
  String? business_name;
  int? sku_id;
  List<String> failure_reasons;

  Items(
      {
        this.product_name,
        this.business_name,
        this.sku_id,
        required this.failure_reasons

      }
      );

  factory Items.fromJson(dynamic json){
    return Items(
        product_name:json['product_name'] as String,
        business_name:json['business_name'] as String,
        sku_id:json["sku_id"] ,
        failure_reasons: json["failure_reasons"]
    );

  }
//sending data to our server
  Map<String,dynamic> toMap(){
    return {
      'product_name': product_name,
      'business_name':business_name,
      'sku_id':sku_id,
      'failure_reasons':failure_reasons,
    };
  }
}

