import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import 'components/contact_group.dart';
import 'components/city.dart';
import 'components/client.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.user});

  final User user;
  final clientsByCity = [
      City(
        cityName: "Praia Grande",
        clients: [
          Client(name: "João", address: "Rua A, 123"),
          Client(name: "Carlos", address: "Rua B, 456"),
        ],
      ),
      City(
        cityName: "Santos",
        clients: [
          Client(name: "Maria", address: "Rua C, 789"),
        ],
      ),
  ];
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final List<TabDestination> destinations = [
      TabDestination(
        appBar: AppBar(
          title: const Text('Clientes', style: TextStyle(color: Colors.white)),
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              onPressed: () async {
                await AuthService().signOut();
              },
              tooltip: 'Sair',
            ),
          ],
        ),
        body: ContactGroup(cities: clientsByCity),
      ),
      TabDestination(
        appBar: AppBar(
          title: const Text('Entregas', style: TextStyle(color: Colors.white)),
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
        ),
        body: const Center(child: Text('Tela de Entregas')), // mudar para widget q englobando tudo q vai aparecer no body de entregas
      )
    ];

    return ValueListenableBuilder<int>(
      valueListenable: _selectedIndex,
      builder: (context, index, child) {
        final currentTab = destinations[index];

        return Scaffold(
          appBar: currentTab.appBar,
          body: currentTab.body,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Create',
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: _DemoBottomAppBar(
            selectedIndex: _selectedIndex,
            fabLocation: FloatingActionButtonLocation.centerDocked,
            shape:  const CircularNotchedRectangle(),
          ),
        );
      }
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    required this.selectedIndex,
    this.fabLocation = FloatingActionButtonLocation.centerDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final ValueNotifier<int> selectedIndex;
  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
    <FloatingActionButtonLocation>[
      FloatingActionButtonLocation.centerDocked,
      FloatingActionButtonLocation.centerFloat,
    ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedIndex,
      builder: (context, activeIndex, child) {
        return BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          shape: shape,
          color: Theme.of(context).colorScheme.primary,
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      constraints: const BoxConstraints(),
                      tooltip: 'Clientes',
                      icon: const Icon(Icons.groups),
                      color: activeIndex == 0 ? Colors.white : Colors.white70,
                      onPressed: () => selectedIndex.value = 0,
                    ),
                    const Text(
                      "Clientes",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                if (centerLocations.contains(fabLocation)) const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      constraints: const BoxConstraints(),
                      tooltip: 'Entregas',
                      icon: const Icon(Icons.local_shipping),
                      color: activeIndex == 1 ? Colors.white : Colors.white70,
                      onPressed: () => selectedIndex.value = 1,
                    ),
                    const Text(
                      "Entregas",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}

class TabDestination {
  final PreferredSizeWidget appBar;
  final Widget body;

  const TabDestination({
    required this.appBar,
    required this.body,
  });
}