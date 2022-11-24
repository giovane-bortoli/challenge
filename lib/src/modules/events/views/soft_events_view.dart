// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:challenge/main.dart';
import 'package:challenge/src/modules/events/widgets/resume_event_card.dart';
import 'package:challenge/src/shared/widgets/empty_state.dart';
import 'package:challenge/src/shared/widgets/error_state.dart';
import 'package:flutter/material.dart';

import 'package:challenge/src/modules/events/controller/event_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SoftEventsView extends StatefulWidget {
  final EventStore eventStore;
  const SoftEventsView({
    Key? key,
    required this.eventStore,
  }) : super(key: key);

  @override
  State<SoftEventsView> createState() => _SoftEventsViewState();
}

class _SoftEventsViewState extends State<SoftEventsView> {
  final eventStore = locator<EventStore>();

  @override
  void initState() {
    initialEventList();
    super.initState();
  }

  Future<void> initialEventList() async {
    await eventStore.getSoftEventList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(context),
    );
  }

  Widget content(context) {
    return Observer(builder: (context) {
      return eventStore.softEventList.isEmpty
          ? const Center(
              child: EmptyState(),
            )
          : eventStore.isError
              ? const ErrorState()
              : Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ListView.builder(
                        itemCount: eventStore.softEventList.length,
                        itemBuilder: ((context, index) {
                          final eventData = eventStore.softEventList[index];
                          return InkWell(
                            onTap: () => Navigator.popAndPushNamed(
                              context,
                              '/eventDetails',
                              arguments: eventStore.softEventList[index],
                            ),
                            child: Column(
                              children: [
                                ResumedEventCard(
                                  event: eventStore.softEventList[index],
                                ),
                                TextButton(
                                  onPressed: () {
                                    eventStore.addFavoriteItemList(eventData);
                                    eventStore.addFavoriteListToPrefs();
                                  },
                                  child: const Text('Salvar evento'),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                );
    });
  }
}
