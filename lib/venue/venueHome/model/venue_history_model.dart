class VenuHistoryModel {
  final String eventName;
  final String eventCode;
  final List<VenuUsage> used;

  const VenuHistoryModel({required this.eventName, required this.eventCode, required this.used});

  factory VenuHistoryModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const VenuHistoryModel(eventName: '', eventCode: '', used: []);

    return VenuHistoryModel(
      eventName: json['eventName'] as String? ?? '',
      eventCode: json['eventCode'] as String? ?? '',
      used:
          (json['used'] as List<dynamic>?)
              ?.map((item) => VenuUsage.fromJson(item as Map<String, dynamic>?))
              .where((usage) => usage != null)
              .cast<VenuUsage>()
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'eventName': eventName,
      'eventCode': eventCode,
      'used': used.map((usage) => usage.toJson()).toList(),
    };
  }
}

class VenuUsage {
  final String type;
  final int count;

  const VenuUsage({required this.type, required this.count});

  factory VenuUsage.fromJson(Map<String, dynamic>? json) {
    if (json == null) return VenuUsage(type: '', count: 0);

    return VenuUsage(type: json['type'] as String? ?? '', count: json['count'] as int? ?? 0);
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'count': count};
  }
}
