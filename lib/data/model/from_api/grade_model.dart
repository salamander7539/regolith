class GradeData {
  GradeData({
    this.total,
    this.raise,
    this.stock,
    this.balanceUsd,
    this.balanceRub,
    this.about,
  });

  final double? total;
  final double? raise;
  final double? stock;
  final double? balanceUsd;
  final int? balanceRub;
  final String? about;

  factory GradeData.fromJson(Map<String, dynamic> json) => GradeData(
    total: json["total"].toDouble(),
    raise: json["raise"].toDouble(),
    stock: json["stock"].toDouble(),
    balanceUsd: json["balanceUSD"].toDouble(),
    balanceRub: json["balanceRUB"],
    about: json["about"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "raise": raise,
    "stock": stock,
    "balanceUSD": balanceUsd,
    "balanceRUB": balanceRub,
    "about": about,
  };
}
