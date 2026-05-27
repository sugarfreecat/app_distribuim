import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/client_list.dart';
import 'components/custom_appbar.dart';
import 'components/custom_bottom_appbar.dart';
import 'components/delivery_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.user});

  final User user;

  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);
  final GlobalKey<ClientListState> _clientKey = GlobalKey<ClientListState>();
  final GlobalKey<DeliveryListState> _deliveryKey = GlobalKey<DeliveryListState>();

  @override
  Widget build(BuildContext context) {
    final List<TabDestination> destinations = [
      TabDestination(
        appBar: CustomAppBar(title: 'Clientes'),
        body: ClientList(key: _clientKey),
      ),
      TabDestination(
        appBar: CustomAppBar(title: 'Entregas'),
        body: DeliveryList(key: _deliveryKey),
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
            onPressed: () {
              // Isso vai mudar dependendo de qual aba o usuário está
              if (_selectedIndex.value == 0) { // Ta na aba de clientes
                _clientKey.currentState?.adicionarCliente();
                
              } else if (_selectedIndex.value == 1) { // Aba de entregas
                _deliveryKey.currentState?.adicionarEntrega();
              }
            },
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