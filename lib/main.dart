import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main () async{
  // Garante que os componentes do flutter estejam prontos antes de chamar o código nativo (tipo o firebase)
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o firebase com as configurações corretas da plataforma
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const DistribuimApp());
}

class DistribuimApp extends StatelessWidget{
  const DistribuimApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'DistribuiM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),

      home: const TelaLogin(),
    );
  }
}

class TelaLogin extends StatelessWidget{
  const TelaLogin({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.local_shipping,
                size: 80,
                color: Colors.green,
              ),
              const SizedBox(height: 16),
              const Text(
                'DistribuiM',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Acesso do motorista',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 48),

              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: (){
                  // Aqui vem o firebase depois
                  print ("Botão clicado");
                },
                 style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                 ),
                 child: const Text(
                  'ENTRAR',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                 ),
                 ),
            ],
          ),
        ),
      )
    );
  }
}