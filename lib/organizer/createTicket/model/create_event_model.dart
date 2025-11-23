// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mainland/user/preferense/model/category_model.dart';
import 'package:mainland/user/preferense/model/sub_category_model.dart';

enum TicketName { Premium, VIP, Standard, Other }

class DiscountCodeModel {
  final String code;
  final int discountPercentage; // e.g., 10 for 10%
  final bool isActive;
  final String filedId;
  final DateTime? expireDate;

  DiscountCodeModel({
    required this.code,
    required this.discountPercentage,
    this.isActive = true,
    required this.filedId,
    this.expireDate
  });

  // Empty Initializer
  static DiscountCodeModel empty() {
    return DiscountCodeModel(
      code: '',
      expireDate: DateTime.now(),
      discountPercentage: 0,
      isActive: true,
      filedId: '',
    );
  }

  // Factory constructor for creating an instance from a JSON map
  factory DiscountCodeModel.fromJson(Map<String, dynamic> json) {
    return DiscountCodeModel(
      code: json['code'] as String? ?? '',
      discountPercentage: json['discountPercentage'] as int? ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      filedId: json['filedId'] as String? ?? '',
      expireDate: json['expireDate'] != null ? DateTime.parse(json['expireDate'] as String) : null,
    );
  }

  // Method to convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'discountPercentage': discountPercentage,
      'isActive': isActive,
      'filedId': filedId,
      'expireDate': expireDate?.toIso8601String(),
    };
  }
}

class TicketTypeModel {
  final TicketName? name;
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
      name: null,
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
              orElse: () => TicketName.Standard,
            )
          : TicketName.Standard,
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
  final String? draftId;
  final String? title;
  final List<String> category;
  final String? description;
  final DateTime? eventDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
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
  final CategoryModel? selectedCategory;
  final List<SubCategoryModel> selectedSubcategories;

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
    required this.startTime,
    required this.endTime,
    required this.streetAddress1,
    this.streetAddress2,
    required this.city,
    required this.state,
    required this.country,
    required this.ticketTypes,
    this.offerPreSale = true,
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
    this.offerDiscountByCode = true,
    this.draftId,
  });

  // Empty Initializer - all dates null
  static CreateEventModel empty() {
    return CreateEventModel(
      title: '',
      category: [],
      description: '',
      eventDate: null,
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now().replacing(hour: TimeOfDay.now().hour + 1),
      streetAddress1: '',
      streetAddress2: '',
      city: '',
      state: '',
      country: '',
      ticketTypes: [],
      offerPreSale: true,
      preSaleStartDate: null,
      preSaleEndDate: null,
      ticketSaleStartDate: null,
      discountCodes: [],
      organizerName: '',
      emailAddress: '',
      phoneNumber: '',
      selectedCategory: CategoryModel.fromMap({}),
      selectedSubcategories: [],
      isFreeEvent: false,
      offerDiscountByCode: true,
      draftId: null,
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
      startTime: json['startTime'],
      endTime: json['endTime'],
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
      isFreeEvent: json['isFreeEvent'] as bool? ?? false,
      offerDiscountByCode: json['offerDiscountByCode'] as bool? ?? false,
      selectedCategory: null,
      selectedSubcategories: [],
      draftId: json['draftId'] as String? ?? '',
    );
  }

  // Method to convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'description': description,
      'eventDate': eventDate?.toIso8601String().split('T').first,
      'startTime': startTime,
      'endTime': endTime,
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
      'draftId': draftId,
    };
  }

  CreateEventModel copyWith({
    String? title,
    List<String>? category,
    String? description,
    DateTime? eventDate,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
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
    CategoryModel? selectedCategory,
    List<SubCategoryModel>? selectedSubcategories,
    String? draftId,
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
      draftId: draftId ?? this.draftId,
    );
  }
}
