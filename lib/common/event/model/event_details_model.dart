import 'package:flutter/material.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';

class EventDetails {
  final String? id;
  final String? userId;
  final String? eventName;
  final String? image;
  final List<Category>? category;
  final List<dynamic>? tags;
  final String? description;
  final DateTime? eventDate;
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;
  final String? streetAddress;
  final String? streetAddress2;
  final String? city;
  final String? state;
  final String? country;
  final String? eventStatus;
  final List<Ticket>? tickets;
  final DateTime? ticketSaleStart;
  final DateTime? preSaleStart;
  final DateTime? preSaleEnd;
  final bool? isFreeEvent;
  final List<DiscountCode>? discountCodes;
  final String? organizerName;
  final String? organizerEmail;
  final String? organizerPhone;
  final String? locationName;
  final int? totalEarned;
  final List<dynamic>? totalReview;
  final bool? isDraft;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  EventDetails({
    this.id,
    this.userId,
    this.eventName,
    this.image,
    this.category,
    this.tags,
    this.description,
    this.eventDate,
    this.startTime,
    this.endTime,
    this.streetAddress,
    this.streetAddress2,
    this.city,
    this.state,
    this.country,
    this.eventStatus,
    this.tickets,
    this.ticketSaleStart,
    this.preSaleStart,
    this.preSaleEnd,
    this.isFreeEvent,
    this.discountCodes,
    this.organizerName,
    this.organizerEmail,
    this.organizerPhone,
    this.locationName,
    this.totalEarned,
    this.totalReview,
    this.isDraft,
    this.createdAt,
    this.updatedAt,
  });

  factory EventDetails.fromJson(Map<String, dynamic> json) {
    return EventDetails(
      id: json['_id'],
      userId: json['userId'],
      eventName: json['eventName'],
      image: json['image'],
      category: (json['category'] as List?)?.map((e) => Category.fromJson(e)).toList(),
      tags: json['tags'],
      description: json['description'],
      eventDate: Utils.parseDate(json['eventDate']),
      startTime: json['startTime'] != null ? (json['startTime'] as String).toTimeOfDay12() : null,
      endTime: json['endTime'] != null ? (json['endTime'] as String).toTimeOfDay12() : null,
      streetAddress: json['streetAddress'],
      streetAddress2: json['streetAddress2'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      eventStatus: json['EventStatus'],
      tickets: (json['tickets'] as List?)?.map((e) => Ticket.fromJson(e)).toList(),
      ticketSaleStart: Utils.parseDate(json['ticketSaleStart']),
      preSaleStart: Utils.parseDate(json['preSaleStart']),
      preSaleEnd: Utils.parseDate(json['preSaleEnd']),
      isFreeEvent: json['isFreeEvent'],
      discountCodes: (json['discountCodes'] as List?)
          ?.map((e) => DiscountCode.fromJson(e))
          .toList(),
      organizerName: json['organizerName'],
      organizerEmail: json['organizerEmail'],
      organizerPhone: json['organizerPhone'],
      locationName: json['locationName'],
      totalEarned: json['totalEarned'],
      totalReview: json['totalReview'],
      isDraft: json['isDraft'],
      createdAt: Utils.parseDate(json['createdAt']),
      updatedAt: Utils.parseDate(json['updatedAt']),
    );
  }
}

class Category {
  final String? categoryId;
  final List<String>? subCategory;
  final String? id;

  Category({this.categoryId, this.subCategory, this.id});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['categoryId'],
      subCategory: List<String?>.from(json['subCategory']).cast<String>(),
      id: json['_id'],
    );
  }
}

class Ticket {
  final TicketName? type;
  final int? price;
  final int? availableUnits;
  final List<dynamic>? ticketBuyerId;
  final String? id;

  Ticket({this.type, this.price, this.availableUnits, this.ticketBuyerId, this.id});

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      type: json['type'] != null
          ? TicketName.values.firstWhere(
              (e) => e.toString().split('.').last == json['type'],
              orElse: () => TicketName.Standard,
            )
          : TicketName.Standard,
      price: json['price'],
      availableUnits: json['availableUnits'],
      ticketBuyerId: json['ticketBuyerId'],
      id: json['_id'],
    );
  }
}

class DiscountCode {
  final String? code;
  final int? percentage;
  final DateTime? expireDate;
  final String? id;

  DiscountCode({this.code, this.percentage, this.expireDate, this.id});

  factory DiscountCode.fromJson(Map<String, dynamic> json) {
    return DiscountCode(
      code: json['code'],
      percentage: json['percentage'],
      expireDate: Utils.parseDate(json['expireDate']),
      id: json['_id'],
    );
  }
}
