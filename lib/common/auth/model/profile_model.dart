// Flutter model class for 'Profile'
import 'package:mainland/common/auth/model/user_login_info_model.dart';

class ProfileModel {
  final String id;
  final String name;
  final Role role;
  final String email;
  final String contact;
  final String image;
  final String status;
  final bool verified;
  final bool termsAndCondition;
  final StripeAccountInfo stripeAccountInfo;
  final PersonalInfo personalInfo;
  final Address address;
  final DateTime joinedDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProfileModel({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.contact,
    required this.image,
    required this.status,
    required this.verified,
    required this.termsAndCondition,
    required this.stripeAccountInfo,
    required this.personalInfo,
    required this.address,
    required this.joinedDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] == 'USER' ? Role.ATTENDEE : Role.ORGANIZER,
      email: json['email'] ?? '',
      contact: json['contact'] ?? '',
      image: json['image'] ?? '',
      status: json['status'] ?? '',
      verified: json['verified'] ?? false,
      termsAndCondition: json['terAndCondition'] ?? false,
      stripeAccountInfo: StripeAccountInfo.fromJson(json['stripeAccountInfo'] ?? {}),
      personalInfo: PersonalInfo.fromJson(json['personalInfo'] ?? {}),
      address: Address.fromJson(json['address'] ?? {}),
      joinedDate: DateTime.tryParse(json['joinedDate'] ?? '') ?? DateTime(1970),
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime(1970),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime(1970),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'role': role.name,
      'email': email,
      'contact': contact,
      'image': image,
      'status': status,
      'verified': verified,
      'terAndCondition': termsAndCondition,
      'stripeAccountInfo': stripeAccountInfo.toJson(),
      'personalInfo': personalInfo.toJson(),
      'address': address.toJson(),
      'joinedDate': joinedDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class StripeAccountInfo {
  StripeAccountInfo({required this.stripeCustomerId});
  final String stripeCustomerId;

  factory StripeAccountInfo.fromJson(Map<String, dynamic> json) {
    return StripeAccountInfo(stripeCustomerId: json['stripeCustomerId'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'stripeCustomerId': stripeCustomerId};
  }
}

class PersonalInfo {
  final String phone;
  final DateTime? dateOfBirth;
  final String firstName;
  final String lastName;

  PersonalInfo({
    required this.phone,
    required this.dateOfBirth,
    required this.firstName,
    required this.lastName,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      phone: json['phone'] ?? '',
      dateOfBirth: json['dateOfBirth'] != null ? DateTime.tryParse(json['dateOfBirth']) : null,
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}

class Address {
  final String city;
  final String street;
  final String country;
  final String postalCode;

  Address({
    required this.city,
    required this.street,
    required this.country,
    required this.postalCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'] ?? '',
      street: json['street'] ?? '',
      country: json['country'] ?? '',
      postalCode: json['postalCode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'city': city, 'street': street, 'country': country, 'postalCode': postalCode};
  }
}
