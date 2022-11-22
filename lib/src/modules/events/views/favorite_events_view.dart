// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:challenge/src/modules/events/controller/event_store.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
