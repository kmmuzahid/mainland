class TicketHistoryDetailsModel {
  final String eventName;
  final TicketSummary summary;
  final List<TicketDetail> details;

  TicketHistoryDetailsModel({
    this.eventName = "",
    TicketSummary? summary,
    List<TicketDetail>? details,
  }) : summary = summary ?? TicketSummary(),
       details = details ?? [];

  factory TicketHistoryDetailsModel.fromJson(Map<String, dynamic>? json) {
    return TicketHistoryDetailsModel(
      eventName: json?['eventName'] ?? "",
      summary: TicketSummary.fromJson(json?['summary']),
      details: (json?['details'] as List?)?.map((e) => TicketDetail.fromJson(e)).toList() ?? [],
    );
  }
}

class TicketSummary {
  final num totalSellAmount;
  final num totalMainlandFee;
  final num totalTickets;
  final List<TicketTypeCount> types;

  TicketSummary({
    this.totalSellAmount = 0,
    this.totalMainlandFee = 0,
    this.totalTickets = 0,
    List<TicketTypeCount>? types,
  }) : types = types ?? [];

  factory TicketSummary.fromJson(Map<String, dynamic>? json) {
    return TicketSummary(
      totalSellAmount: json?['totalSellAmount'] ?? 0,
      totalMainlandFee: json?['totalMainlandFee'] ?? 0,
      totalTickets: json?['totalTickets'] ?? 0,
      types: (json?['types'] as List?)?.map((e) => TicketTypeCount.fromJson(e)).toList() ?? [],
    );
  }
}

class TicketTypeCount {
  final String ticketType;
  final num count;

  TicketTypeCount({this.ticketType = "", this.count = 0});

  factory TicketTypeCount.fromJson(Map<String, dynamic>? json) {
    return TicketTypeCount(ticketType: json?['ticketType'] ?? "", count: json?['count'] ?? 0);
  }
}

class TicketDetail {
  final String ticketType;
  final num quantity;
  final num price;
  final num commission;

  TicketDetail({this.ticketType = "", this.quantity = 0, this.price = 0, this.commission = 0});

  factory TicketDetail.fromJson(Map<String, dynamic>? json) {
    return TicketDetail(
      ticketType: json?['ticketType'] ?? "",
      quantity: json?['quantity'] ?? 0,
      price: json?['price'] ?? 0,
      commission: json?['commission'] ?? 0,
    );
  }
}
