// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PreferenceState extends Equatable {
  PreferenceState({required this.selectedSubcategories, this.selectedCategory});

  final Map<String, List<String>> data = {
    'Music & Entertainment': [
      'Concerts',
      'Festivals',
      'Comedy & Stand-Up',
      'Theater & Performing Arts',
      'Movies & Screenings',
      'TV & Pop Culture Events',
    ],
    'Sports & Fitness': [
      'Professional Sports',
      'College Sports',
      'Extreme / Adventure Sports',
      'Fitness & Wellness',
      'Esports & Gaming Tournaments',
    ],
    'Arts & Culture': [
      'Museums & Exhibitions',
      'Art Shows & Galleries',
      'Cultural Festivals',
      'Literature & Poetry',
      'History & Heritage Tours',
    ],
    'Fashion & Lifestyle': [
      'Fashion Shows',
      'Beauty & Wellness',
      'Shopping & Pop-Up Markets',
      'Style & Trends Events',
    ],
    'Food & Drink': [
      'Food Festivals',
      'Wine, Beer & Spirits Tastings',
      'Restaurant & Chef Experiences',
      'Cooking Classes',
    ],
    'Community & Networking': [
      'Family & Kids',
      'Networking & Business',
      'Conferences & Seminars',
      'Charity & Fundraisers',
      'Social Clubs & Meetups',
    ],
    'Nightlife & Parties': [
      'Club Nights & DJ Sets',
      'Dance Events',
      'Themed Parties',
      'Bar Crawls',
    ],
    'Seasonal & Special': [
      'Holiday Celebrations',
      'Parades & Street Fairs',
      'Religious & Spiritual Events',
      'Local Markets & Fairs',
    ],
  };

  final List<String> selectedSubcategories;
  final String? selectedCategory;

  @override
  List<Object> get props => [selectedSubcategories, selectedCategory ?? ''];

  PreferenceState copyWith({List<String>? selectedSubcategories, String? selectedCategory}) {
    return PreferenceState(
      selectedSubcategories: selectedSubcategories ?? this.selectedSubcategories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
