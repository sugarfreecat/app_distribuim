import 'package:flutter/material.dart';

class DeliveryList extends StatefulWidget {
  const DeliveryList({super.key});

  @override
  State<DeliveryList> createState() => DeliveryListState();
}

class DeliveryListState extends State<DeliveryList> {
  final List<String> _entregas = [
  ];

  void adicionarEntrega() {
    // Essa função vai conectar com o backend pra pegar as informações necessárias da entrega
    // Como nome do cliente e endereço
    setState(() {
      _entregas.add("Entrega ${_entregas.length + 1} - Endereço a definir");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _entregas.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 2,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.local_shipping, color: Colors.white, size: 20),
            ),
            title: Text(
              _entregas[index],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Status: Pendente'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        );
      },
    );
  }
}