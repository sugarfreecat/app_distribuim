import 'package:flutter/material.dart';
import 'custom_appbar.dart';
// import 'custom_bottom_appbar.dart';

class ClientForm extends StatelessWidget {
  final List <String> _cities = ['Santos', 'São Vicente', 'Guarujá', 'Praia Grande', 'Cubatão', 'Bertioga', 'Mongaguá', 'Itanhaém'];
  ClientForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Novo Cliente', leading: true),
      backgroundColor: const Color(0xFFF7F8F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Cadastrar Cliente',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Preencha os dados abaixo',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CustomInput(label: 'Nome', hintText: 'Digite o nome do cliente'),
                    const SizedBox(height: 20),
                    CustomInput(label: 'Endereço', hintText: 'Digite o endereço do cliente'),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return DropdownMenu<String>(
                            width: constraints.maxWidth,
                            expandedInsets: EdgeInsets.zero,
                            hintText: 'Cidade',
                            menuHeight: 300,

                            menuStyle: MenuStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.white),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(14), bottomRight: Radius.circular(14)),
                                ),
                              ),
                            ),

                            inputDecorationTheme: InputDecorationTheme(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 25,
                              ),
                            ),

                            dropdownMenuEntries: _cities.map(
                              (city) => DropdownMenuEntry(
                                value: city,
                                label: city,
                                style: ButtonStyle(
                                  padding: WidgetStatePropertyAll(
                                    const EdgeInsets.symmetric(horizontal: 20),
                                  ),
                                  textStyle: WidgetStatePropertyAll(
                                    const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                            )).toList(),

                            onSelected: (value) {},
                          );
                        }
                      )
                    ),
                    const SizedBox(height: 20),
                    CustomInput(label: 'Telefone', hintText: 'Digite o telefone do cliente'),
                    const SizedBox(height: 20),
                    CustomInput(label: 'Complemento ou ponto de referência', hintText: 'Digite o complemento ou ponto de referência do cliente'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              backgroundColor: const Color(0xFF4D7C42),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Salvar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  const CustomInput({super.key, required this.label, required this.hintText});
  final String label;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 25,
          ),
        ),
      ),
    );
  }
}