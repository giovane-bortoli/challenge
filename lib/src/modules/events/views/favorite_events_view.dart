// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:challenge/main.dart';
import 'package:challenge/src/modules/events/widgets/resume_event_card.dart';
import 'package:challenge/src/shared/widgets/empty_state.dart';
import 'package:challenge/src/shared/widgets/error_state.dart';
import 'package:flutter/material.dart';

import 'package:challenge/src/modules/events/controller/event_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FavoriteEventView extends StatefulWidget {
  final EventStore eventStore;
  const FavoriteEventView({
    Key? key,
    required this.eventStore,
  }) : super(key: key);

  @override
  State<FavoriteEventView> createState() => _FavoriteEventViewState();
}

class _FavoriteEventViewState extends State<FavoriteEventView> {
  final eventStore = locator<EventStore>();

  @override
  void initState() {
    loadFavoriteList();
    super.initState();
  }

  Future<void> loadFavoriteList() async {
    await eventStore.loadFavoriteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(context),
    );
  }

  Widget content(context) {
    return Observer(builder: (context) {
      return eventStore.favoriteEventList.isEmpty
          ? const Center(
              child: EmptyState(),
            )
          : eventStore.isError
              ? const ErrorState()
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: eventStore.favoriteEventList.length,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () => Navigator.popAndPushNamed(
                              context,
                              '/eventDetails',
                              arguments: eventStore.favoriteEventList[index],
                            ),
                            child: ResumedEventCard(
                              event: eventStore.favoriteEventList[index],
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
