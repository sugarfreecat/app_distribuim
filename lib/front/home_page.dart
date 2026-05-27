import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/client_list.dart';
import 'components/custom_appbar.dart';
import 'components/custom_bottom_appbar.dart';

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
        appBar: CustomAppBar(title: 'Clientes'),
        body: ClientList(cities: clientsByCity),
      ),
      TabDestination(
        appBar: CustomAppBar(title: 'Entregas'),
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
            tooltip: 'Formulário',
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomBottomAppBar(
            selectedIndex: _selectedIndex,
            fabLocation: FloatingActionButtonLocation.centerDocked,
            shape:  const CircularNotchedRectangle(),
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