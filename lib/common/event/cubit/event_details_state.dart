import 'package:equatable/equatable.dart';

class EventDetailsState extends Equatable {
  const EventDetailsState({
    this.showDetails = false,
    this.details = '''Event Description
A casual yet insightful gathering for designers, creators, and digital thinkers to connect, share stories, and explore the future of design. Join us for a day filled with inspiring talks, interactive sessions, and networking with local talents from the creative industry. Join us for a day filled with inspiring talks, interactive sessions, and networking with local talents from the creative industry.
Event Description
A casual yet insightful gathering for designers, creators, and digital thinkers to connect, share stories, and explore the future of design. Join us for a day filled with inspiring talks, interactive sessions, and networking with local talents from the creative industry. Join us for a day filled with inspiring talks, interactive sessions, and networking with local talents from the creative industry.
Event Description
A casual yet insightful gathering for designers, creators, and digital thinkers to connect, share stories, and explore the future of design. Join us for a day filled with inspiring talks, interactive sessions, and networking with local talents from the creative industry. Join us for a day filled with inspiring talks, interactive sessions, and networking with local talents from the creative industry.
Event Description
A casual yet insightful gathering for designers, creators, and digital thinkers to connect, share stories, and explore the future of design. Join us for a day filled with inspiring talks, interactive sessions, and networking with local talents from the creative industry. Join us for a day filled with inspiring talks, interactive sessions, and networking with local talents from the creative industry.
Event Description
A casual yet insightful gathering for designers, creators, and digital thinkers to connect, share stories, and explore the future of design. Join us for a day filled with inspiring talks, interactive sessions, and networking with local talents from the creative industry. Join us for a day filled with inspiring talks, interactive sessions, and networking with local talents from the creative industry.
Event Description
A casual yet insightful gathering for designers, creators, and digital thinkers to connect, share stories, and explore the future of design. Join us for a day filled with inspiring talks, interactive sessions, and networking with local talents from the creative industry. Join us for a day filled with inspiring talks, interactive sessions, and networking with local talents from the creative industry.''',
  });
  final bool showDetails;
  final String details;

  @override
  List<Object?> get props => [showDetails];
}
