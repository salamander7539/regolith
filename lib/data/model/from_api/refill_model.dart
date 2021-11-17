class RefillData {
  RefillData({
    this.total,
    this.withdrawn,
    this.refillUsd,
    this.refillRub,
    this.about,
  });

  final double? total;
  final double? withdrawn;
  final double? refillUsd;
  final int? refillRub;
  final String? about;

  factory RefillData.fromJson(Map<String, dynamic> json) => RefillData(
    total: json["total"].toDouble(),
    withdrawn: json["withdrawn"].toDouble(),
    refillUsd: json["refillUSD"].toDouble(),
    refillRub: json["refillRUB"],
    about: json["about"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "withdrawn": withdrawn,
    "refillUSD": refillUsd,
    "refillRUB": refillRub,
    "about": about,
  };
}
