import 'package:flutter/material.dart';
import 'city.dart';
import 'client.dart';

class ContactGroup extends StatelessWidget {
  final List<City> cities;

  const ContactGroup({
    super.key,
    required this.cities,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: cities.map((city) {

        return Column(
          children: [
            ContactGroupHeader(city: city),
            ...city.clients.map((client) {
              return Column(
                children: [
                  ContactGroupClients(client: client),
                  const Divider(height: 1, thickness: 1, color: Color.fromARGB(120, 158, 158, 158)),
                ],
              );
            }),
          ],
        );

      }).toList(),
    );
  }
}

class ContactGroupHeader extends StatelessWidget {
  final City city;
  const ContactGroupHeader({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: Row(
        children: [
          Text(
            city.cityName,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),

          const SizedBox(width: 10),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              "R\$0.00",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactGroupClients extends StatelessWidget {
  final Client client;
  const ContactGroupClients({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // lado esquerdo com nome e endereço
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.group, color: Colors.green[700]),

                        const SizedBox(width: 8),

                        Text(
                          client.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Text(
                      client.address,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),

              // preço do lado direito
              const Text(
                "R\$0.00",
                style: TextStyle(
                  color: Color.fromARGB(255, 212, 30, 17),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // botões
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.phone),
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chat_bubble),
              ),
            ],
          ),
        ],
      ),
    );
  }
}