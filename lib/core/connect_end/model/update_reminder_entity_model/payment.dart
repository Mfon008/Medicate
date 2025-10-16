class Payment {
  int? amount;
  String? currency;

  Payment({this.amount, this.currency});

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    amount: json['amount'] as int?,
    currency: json['currency'] as String?,
  );

  Map<String, dynamic> toJson() => {'amount': amount, 'currency': currency};
}
