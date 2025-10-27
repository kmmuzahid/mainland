// ignore_for_file: public_member_api_docs, sort_constructors_first
enum TicketName { premium, vip, standard, other }

class DiscountCodeModel {
  final String code;
  final int discountPercentage; // e.g., 10 for 10%
  final bool isActive;

  DiscountCodeModel({required this.code, required this.discountPercentage, this.isActive = true});

  // Empty Initializer
  static DiscountCodeModel empty() {
    return DiscountCodeModel(code: '', discountPercentage: 0, isActive: true);
  }

  // Factory constructor for creating an instance from a JSON map
  factory DiscountCodeModel.fromJson(Map<String, dynamic> json) {
    return DiscountCodeModel(
      code: json['code'] as String? ?? '',
      discountPercentage: json['discountPercentage'] as int? ?? 0,
      isActive: json['isActive'] as bool? ?? true,
    );
  }

  // Method to convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {'code': code, 'discountPercentage': discountPercentage, 'isActive': isActive};
  }
}

class TicketTypeModel {
  final TicketName name;
  final double setUnitPrice;
  final int availableUnit;
  final DateTime? saleStartDate;
  final DateTime? saleEndDate;

  TicketTypeModel({
    required this.name,
    required this.setUnitPrice,
    required this.availableUnit,
    this.saleStartDate,
    this.saleEndDate,
  });

  // Empty Initializer - all dates null
  static TicketTypeModel empty() {
    return TicketTypeModel(
      name: TicketName.standard,
      setUnitPrice: 0.0,
      availableUnit: 0,
      saleStartDate: null,
      saleEndDate: null,
    );
  }

  // Factory constructor for JSON with safe defaults
  factory TicketTypeModel.fromJson(Map<String, dynamic> json) {
    return TicketTypeModel(
      name: json['name'] != null
          ? TicketName.values.firstWhere(
              (e) => e.toString().split('.').last == json['name'],
              orElse: () => TicketName.standard,
            )
          : TicketName.standard,
      setUnitPrice: (json['setUnitPrice'] as num?)?.toDouble() ?? 0.0,
      availableUnit: json['availableUnit'] as int? ?? 0,
      saleStartDate: json['saleStartDate'] != null
          ? DateTime.tryParse(json['saleStartDate'] as String)
          : null,
      saleEndDate: json['saleEndDate'] != null
          ? DateTime.tryParse(json['saleEndDate'] as String)
          : null,
    );
  }

  // Method to convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name.toString().split('.').last,
      'setUnitPrice': setUnitPrice,
      'availableUnit': availableUnit,
      'saleStartDate': saleStartDate?.toIso8601String(),
      'saleEndDate': saleEndDate?.toIso8601String(),
    };
  }

  TicketTypeModel copyWith({
    TicketName? name,
    double? setUnitPrice,
    int? availableUnit,
    DateTime? saleStartDate,
    DateTime? saleEndDate,
  }) {
    return TicketTypeModel(
      name: name ?? this.name,
      setUnitPrice: setUnitPrice ?? this.setUnitPrice,
      availableUnit: availableUnit ?? this.availableUnit,
      saleStartDate: saleStartDate ?? this.saleStartDate,
      saleEndDate: saleEndDate ?? this.saleEndDate,
    );
  }
}

class CreateEventModel {
  // Event Details
  final String? title;
  final List<String> category;
  final String? description;
  final DateTime? eventDate;
  final DateTime? startTime;
  final DateTime? endTime;
  final String streetAddress1;
  final String? streetAddress2;
  final String? city;
  final String? state;
  final String? country;

  // Tickets Details
  final List<TicketTypeModel> ticketTypes;
  final bool isFreeEvent;

  // Pre-Sale Details
  final bool offerPreSale;
  final DateTime? preSaleStartDate;
  final DateTime? preSaleEndDate;
  final DateTime? ticketSaleStartDate;

  // Discount Codes
  final List<DiscountCodeModel> discountCodes;
  final String selectedCategory;
  final List<String> selectedSubcategories;


  // Event Organizer Details
  final String? organizerName;
  final String? emailAddress;
  final String? phoneNumber;
  final bool offerDiscountByCode;

  CreateEventModel({
    required this.title,
    required this.category,
    this.description,
    this.eventDate,
    this.startTime,
    this.endTime,
    required this.streetAddress1,
    this.streetAddress2,
    required this.city,
    required this.state,
    required this.country,
    required this.ticketTypes,
    this.offerPreSale = false,
    this.preSaleStartDate,
    this.preSaleEndDate,
    this.ticketSaleStartDate,
    required this.discountCodes,
    required this.organizerName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.selectedCategory,
    required this.selectedSubcategories,
    this.isFreeEvent = false,
    this.offerDiscountByCode = false,
  });

  // Empty Initializer - all dates null
  static CreateEventModel empty() {
    return CreateEventModel(
      title: '',
      category: [],
      description: '',
      eventDate: null,
      startTime: null,
      endTime: null,
      streetAddress1: '',
      streetAddress2: '',
      city: '',
      state: '',
      country: '',
      ticketTypes: [],
      offerPreSale: false,
      preSaleStartDate: null,
      preSaleEndDate: null,
      ticketSaleStartDate: null,
      discountCodes: [],
      organizerName: '',
      emailAddress: '',
      phoneNumber: '',
      selectedCategory: '',
      selectedSubcategories: [],
      isFreeEvent: false,
      offerDiscountByCode: false,
    );
  }

  // Factory constructor with safe defaults for all fields
  factory CreateEventModel.fromJson(Map<String, dynamic> json) {
    return CreateEventModel(
      title: json['title'] as String? ?? '',
      ticketSaleStartDate: json['ticketSaleStartDate'] != null
          ? DateTime.tryParse(json['ticketSaleStartDate'] as String)
          : null,
      category: json['category'] ?? [],
      description: json['description'] as String?,
      eventDate: json['eventDate'] != null ? DateTime.tryParse(json['eventDate'] as String) : null,
      startTime: json['startTime'] != null ? DateTime.tryParse(json['startTime'] as String) : null,
      endTime: json['endTime'] != null ? DateTime.tryParse(json['endTime'] as String) : null,
      streetAddress1: json['streetAddress1'] as String? ?? '',
      streetAddress2: json['streetAddress2'] as String?,
      city: json['city'] as String? ?? '',
      state: json['state'] as String? ?? '',
      country: json['country'] as String? ?? '',
      ticketTypes: json['ticketTypes'] != null
          ? (json['ticketTypes'] as List<dynamic>)
                .map((item) => TicketTypeModel.fromJson(item as Map<String, dynamic>))
                .toList()
          : [],
      offerPreSale: json['offerPreSale'] as bool? ?? false,
      preSaleStartDate: json['preSaleStartDate'] != null
          ? DateTime.tryParse(json['preSaleStartDate'] as String)
          : null,
      preSaleEndDate: json['preSaleEndDate'] != null
          ? DateTime.tryParse(json['preSaleEndDate'] as String)
          : null,
      discountCodes: json['discountCodes'] != null
          ? (json['discountCodes'] as List<dynamic>)
                .map((item) => DiscountCodeModel.fromJson(item as Map<String, dynamic>))
                .toList()
          : [],
      organizerName: json['organizerName'] as String? ?? '',
      emailAddress: json['emailAddress'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      selectedCategory: json['selectedCategory'] as String? ?? '',
      selectedSubcategories: json['selectedSubcategories'] as List<String>? ?? [],
      isFreeEvent: json['isFreeEvent'] as bool? ?? false,
      offerDiscountByCode: json['offerDiscountByCode'] as bool? ?? false,
    );
  }

  // Method to convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'description': description,
      'eventDate': eventDate?.toIso8601String().split('T').first,
      'startTime': startTime?.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'streetAddress1': streetAddress1,
      'streetAddress2': streetAddress2,
      'city': city,
      'state': state,
      'country': country,
      'ticketTypes': ticketTypes.map((t) => t.toJson()).toList(),
      'offerPreSale': offerPreSale,
      'preSaleStartDate': preSaleStartDate?.toIso8601String(),
      'preSaleEndDate': preSaleEndDate?.toIso8601String(),
      'discountCodes': discountCodes.map((d) => d.toJson()).toList(),
      'organizerName': organizerName,
      'emailAddress': emailAddress,
      'phoneNumber': phoneNumber,
      'isFreeEvent': isFreeEvent,
      'ticketSaleStartDate': ticketSaleStartDate?.toIso8601String(),
      'offerDiscountByCode': offerDiscountByCode,
      'selectedCategory': selectedCategory,
      'selectedSubcategories': selectedSubcategories,
    };
  }

  CreateEventModel copyWith({
    String? title,
    List<String>? category,
    String? description,
    DateTime? eventDate,
    DateTime? startTime,
    DateTime? endTime,
    String? streetAddress1,
    String? streetAddress2,
    String? city,
    String? state,
    String? country,
    List<TicketTypeModel>? ticketTypes,
    bool? offerPreSale,
    DateTime? preSaleStartDate,
    DateTime? preSaleEndDate,
    List<DiscountCodeModel>? discountCodes,
    String? organizerName,
    String? emailAddress,
    String? phoneNumber,
    bool? offerDiscountByCode,
    bool? isFreeEvent,
    DateTime? ticketSaleStartDate,
    String? selectedCategory,
    List<String>? selectedSubcategories,
  }) {
    return CreateEventModel(
      title: title ?? this.title,
      category: category ?? this.category,
      description: description ?? this.description,
      eventDate: eventDate ?? this.eventDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      streetAddress1: streetAddress1 ?? this.streetAddress1,
      streetAddress2: streetAddress2 ?? this.streetAddress2,
      city: city ?? this.city,
      state: state ?? this.state, 
      country: country ?? this.country,
      ticketTypes: ticketTypes ?? this.ticketTypes,
      offerPreSale: offerPreSale ?? this.offerPreSale,
      preSaleStartDate: preSaleStartDate ?? this.preSaleStartDate,
      preSaleEndDate: preSaleEndDate ?? this.preSaleEndDate,
      discountCodes: discountCodes ?? this.discountCodes,
      organizerName: organizerName ?? this.organizerName,
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isFreeEvent: isFreeEvent ?? this.isFreeEvent,
      ticketSaleStartDate: ticketSaleStartDate ?? this.ticketSaleStartDate,
      offerDiscountByCode: offerDiscountByCode ?? this.offerDiscountByCode,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedSubcategories: selectedSubcategories ?? this.selectedSubcategories,
    );
  }
}
