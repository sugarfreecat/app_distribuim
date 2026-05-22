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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 86, 0),
        centerTitle: true,
        title: const Text('Clientes', style: TextStyle(color: Colors.white)),
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
    );
  }
}
