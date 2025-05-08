import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SonidoAnimalScreen extends StatefulWidget {
  const SonidoAnimalScreen({super.key});

  @override
  State<SonidoAnimalScreen> createState() => _SonidoAnimalScreenState();
}

class _SonidoAnimalScreenState extends State<SonidoAnimalScreen> {
  TextEditingController controlText = TextEditingController();
  final AudioPlayer _player = AudioPlayer();
  String? animalActual; 
  Map<String, Map<String, String>> datosAnimal = {
    'gato': {
      'image': 'assets/images/gato.png',
      'sound': 'sounds/gato.mp3',
    },
    'perro': {
      'image': 'assets/images/perro.png',
      'sound': 'sounds/perro.mp3',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sonido de animales'),
      ),
      body: Column(
        children: [
          Text('Escribe el nomre del animal gato o perro'),
          TextField(
            controller: controlText,
          ),
          ElevatedButton(onPressed: buscarAnimal, child: Text('Buscar')),
          //image
          SizedBox(height: 30,),
          if (animalActual != null) ... {
            Image.asset(datosAnimal[animalActual]!['image']!),
            Text('es un: $animalActual'),
          },
        ],
      ),
    );
  }

  void buscarAnimal() {
    String nombreAnimal = controlText.text;
    if (datosAnimal.containsKey(nombreAnimal)) {
      _player.play(AssetSource(datosAnimal[nombreAnimal]!['sound']!)); // comentar
      // ! = va haber algo que se va reproducir
      setState(() {
        animalActual = nombreAnimal;
      });
    }
  }
}