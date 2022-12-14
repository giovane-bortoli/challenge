import 'package:challenge/main.dart';
import 'package:challenge/src/modules/events/controller/event_store.dart';
import 'package:challenge/src/modules/events/models/event_model.dart';
import 'package:challenge/src/modules/events/widgets/event_card.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatefulWidget {
  static const routeName = '/eventDetails';

  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  final eventStore = locator<EventStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do evento'),
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/events');
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: content(context),
    );
  }

  Widget content(context) {
    final event = ModalRoute.of(context)!.settings.arguments as EventModel;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          EventCard(
            eventModel: event,
            maxLinesDescription: 10,
          ),
        ],
      ),
    );
  }
}
