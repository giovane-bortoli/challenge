import 'dart:async';

import 'package:challenge/main.dart';
import 'package:challenge/src/modules/auth/controller/auth_store.dart';
import 'package:challenge/src/modules/events/controller/connectivity_store.dart';
import 'package:challenge/src/modules/events/controller/event_store.dart';

import 'package:challenge/src/modules/events/views/favorite_events_view.dart';
import 'package:challenge/src/modules/events/views/soft_events_view.dart';
import 'package:challenge/src/shared/utils/app_colors.dart';
import 'package:challenge/src/shared/widgets/custom_snack_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
  final authStore = locator<AuthStore>();
  final connectivityStore = locator<ConnectivityStore>();

  @override
  void initState() {
    connectivityStore.initConnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
          length: 2,
          child: Observer(builder: (context) {
            return Scaffold(
              appBar: AppBar(
                leading: StreamBuilder(
                  stream: Stream.value(connectivityStore.connectionStatus),
                  builder: ((context, snapshot) =>
                      snapshot.data == ConnectivityResult.wifi
                          ? const Icon(
                              Icons.wifi,
                              color: Colors.green,
                            )
                          : connectivityStore.connectionStatus ==
                                  ConnectivityResult.mobile
                              ? const Icon(
                                  Icons.signal_cellular_alt,
                                  color: Colors.yellow,
                                )
                              : const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                )),
                ),
                toolbarHeight: 70,
                centerTitle: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      eventStore.status,
                      style: const TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        authStore.logOut().then((value) =>
                            Navigator.popAndPushNamed(context, '/login'));
                      },
                      icon: const Icon(Icons.exit_to_app))
                ],
                title: const Text('Eventos'),
              ),
              body: content(context),
            );
          }),
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
