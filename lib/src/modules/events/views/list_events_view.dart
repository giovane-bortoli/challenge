import 'package:challenge/main.dart';
import 'package:challenge/src/modules/events/controller/event_store.dart';
import 'package:challenge/src/modules/events/models/event_model.dart';
import 'package:challenge/src/modules/events/views/favorite_events_view.dart';
import 'package:challenge/src/modules/events/views/soft_events_view.dart';
import 'package:challenge/src/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_overlay/loading_overlay.dart';

class ListEventsView extends StatefulWidget {
  const ListEventsView({super.key});

  static const routeName = '/events';

  @override
  State<ListEventsView> createState() => _ListEventsViewState();
}

class _ListEventsViewState extends State<ListEventsView> {
  final eventStore = locator<EventStore>();

  // @override
  // void initState() {
  //   initialEventList();
  //   super.initState();
  // }

  // Future<void> initialEventList() async {
  //   await eventStore.getSoftEventList();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Eventos'),
            ),
            body: content(context),
          ),
        ),
      ],
    );
  }

  Widget content(context) {
    return Observer(builder: (context) {
      return LoadingOverlay(
        isLoading: eventStore.isLoading,
        child: Column(
          children: [
            _tabBar(),
            _tabData(eventStore),
          ],
        ),
      );
    });
  }

  Widget _tabBar() => const TabBar(
        labelColor: AppColors.neutralColorLowLight,
        padding: EdgeInsets.only(top: 16, bottom: 8),
        indicatorPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        indicatorColor: AppColors.deepPurple,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: AppColors.neutralColorLowLight,
        tabs: [
          Tab(
            text: 'Eventos Soft',
          ),
          Tab(
            text: 'Eventos Favoritos',
          )
        ],
      );

  Widget _tabData(EventStore eventStore) => Expanded(
        child: TabBarView(
          children: [
            SoftEventsView(eventStore: eventStore),
            FavoriteEventView(eventStore: eventStore),
          ],
        ),
      );
}
