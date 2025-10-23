// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'venue_cubit.dart';

class VenueState extends Equatable {
  const VenueState({
    required this.currentIndex,
    this.about =
        '<html><body>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem </body></html>',
    this.faqHelp =
        '<html><body>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem </body></html>',
  });
  final int currentIndex;
  final String about;
  final String faqHelp;

  @override
  List<Object?> get props => [currentIndex, about, faqHelp];

  VenueState copyWith({int? currentIndex, String? about, String? faqHelp}) {
    return VenueState(
      currentIndex: currentIndex ?? this.currentIndex,
      about: about ?? this.about,
      faqHelp: faqHelp ?? this.faqHelp,
    );
  }
}
