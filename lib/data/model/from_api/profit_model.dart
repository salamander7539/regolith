class ProfitData {
  ProfitData({
    this.total,
    this.raise,
    this.invest,
    this.price,
    this.about,
  });

  final double? total;
  final double? raise;
  final double? invest;
  final double? price;
  final String? about;

  factory ProfitData.fromJson(Map<String, dynamic> json) => ProfitData(
    total: json["total"].toDouble(),
    raise: json["raise"].toDouble(),
    invest: json["invest"].toDouble(),
    price: json["price"].toDouble(),
    about: json["about"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "raise": raise,
    "invest": invest,
    "price": price,
    "about": about,
  };
}
