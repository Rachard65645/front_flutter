class PositionModel {
  final String ip;
  final String city;
  final String region;
  final String country;
  final String loc;
  final String org;
  final String timezone;

  PositionModel({
    required this.ip,
    required this.city,
    required this.region,
    required this.country,
    required this.loc,
    required this.org,
    required this.timezone,
  });

  factory PositionModel.fromJson(Map<String, dynamic> json) {
    return PositionModel(
      ip: json['ip'],
      city: json['city'],
      region: json['region'],
      country: json['country'],
      loc: json['loc'],
      org: json['org'],
      timezone: json['timezone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ip': ip,
      'city': city,
      'region': region,
      'country': country,
      'loc': loc,
      'org': org,
      'timezone': timezone,
    };
  }
}
