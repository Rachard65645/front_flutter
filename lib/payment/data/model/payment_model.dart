class PaymentModel {
  final bool? success;
  final String paymentUrl;

  PaymentModel({ this.success, required this.paymentUrl});

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      success: json['success'],
      paymentUrl: json['payment_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'payment_url': paymentUrl,
    };
  }
}
