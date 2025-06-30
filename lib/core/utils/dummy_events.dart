import 'package:flutfest/logic/models/event_model.dart';
import 'package:flutfest/theme.dart';

class DummyEvents {
  static List<EventModel> events = [
    // Past Events
    EventModel(
      image: '${AppTheme.eventDirectory}marriage.png',
      id: 1,
      title: 'Wedding Celebration',
      description: 'A wonderful wedding event.',
      date: '2024-04-10',
      location: 'Cairo',
    ),
    EventModel(
      image: '${AppTheme.eventDirectory}birthday.png',
      id: 2,
      title: 'Birthday Party',
      description: 'A fun birthday celebration.',
      date: '2024-03-15',
      location: 'Alexandria',
    ),
    EventModel(
      image: '${AppTheme.eventDirectory}graduation.png',
      id: 3,
      title: 'Graduation Ceremony',
      description: 'An inspiring graduation event.',
      date: '2024-02-20',
      location: 'Giza',
    ),
    EventModel(
      image: '${AppTheme.eventDirectory}engagement.png',
      id: 4,
      title: 'Engagement Party',
      description: 'A beautiful engagement celebration.',
      date: '2024-01-25',
      location: 'Aswan',
    ),
    EventModel(
      image: '${AppTheme.eventDirectory}dinner.png',
      id: 5,
      title: 'Dinner Gathering',
      description: 'A cozy dinner with friends and family.',
      date: '2023-12-31',
      location: 'Luxor',
    ),
    // Upcoming Events
    EventModel(
      image: '${AppTheme.eventDirectory}concert.jpeg',
      id: 6,
      title: 'Music Concert',
      description: 'A thrilling music concert.',
      date: '2024-10-01',
      location: 'Cairo',
      isUpcomingForDemo: true,
    ),
    EventModel(
      image: '${AppTheme.eventDirectory}festival.jpeg',
      id: 7,
      title: 'Cultural Festival',
      description: 'A vibrant cultural festival.',
      date: '2024-10-15',
      location: 'Alexandria',
      isUpcomingForDemo: true,
    ),
    EventModel(
      image: '${AppTheme.eventDirectory}seminar.jpeg',
      id: 8,
      title: 'Business Seminar',
      description: 'An informative business seminar.',
      date: '2024-11-01',
      location: 'Giza',
      isUpcomingForDemo: true,
    ),
    EventModel(
      image: '${AppTheme.eventDirectory}exhibition.jpeg',
      id: 9,
      title: 'Art Exhibition',
      description: 'A stunning art exhibition.',
      date: '2024-11-15',
      location: 'Aswan',
      isUpcomingForDemo: true,
    ),
    EventModel(
      image: '${AppTheme.eventDirectory}charity_gala.jpeg',
      id: 10,
      title: 'Charity Gala',
      description: 'A luxurious charity gala.',
      date: '2024-12-01',
      location: 'Luxor',
      isUpcomingForDemo: true,
    ),
  ];
}
