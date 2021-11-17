class BonusData {
  BonusData({
    this.totalRub,
    this.totalUsd,
    this.team,
    this.refillUsd,
    this.refillRub,
    this.about,
  });

  final double? totalRub;
  final double? totalUsd;
  final int? team;
  final double? refillUsd;
  final int? refillRub;
  final String? about;

  factory BonusData.fromJson(Map<String, dynamic> json) => BonusData(
    totalRub: json["totalRUB"].toDouble(),
    totalUsd: json["totalUSD"].toDouble(),
    team: json["team"],
    refillUsd: json["refillUSD"].toDouble(),
    refillRub: json["refillRUB"],
    about: json["about"],
  );

  Map<String, dynamic> toJson() => {
    "totalRUB": totalRub,
    "totalUSD": totalUsd,
    "team": team,
    "refillUSD": refillUsd,
    "refillRUB": refillRub,
    "about": about,
  };
}
