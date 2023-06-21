class Test {
  int? customerId;
  String? phone;
  String? customerName;
  String? orderCode;
  String? paymentStatus;
  String? orderCreated;
  String? details;
  String? cost;

  Test({
    this.customerId,
    this.phone,
    this.customerName,
    this.orderCode,
    this.paymentStatus,
    this.orderCreated,
    this.details,
    this.cost,
  });

  Map<String, dynamic> toJson() {
    return {
      'customer_id': customerId,
      'phone': phone,
      'customer_name': customerName,
      'order_code': orderCode,
      'payment_status': paymentStatus,
      'order_created': orderCreated,
      'details': details,
      'cost': cost,
    };
  }

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      customerId: json['customer_id'] as int?,
      phone: json['phone'] as String?,
      customerName: json['customer_name'] as String?,
      orderCode: json['order_code'] as String?,
      paymentStatus: json['payment_status'] as String?,
      orderCreated: json['order_created'] as String?,
      details: json['details'] as String?,
      cost: json['cost'] as String?,
    );
  }
}
