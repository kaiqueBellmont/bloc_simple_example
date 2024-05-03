import 'package:flutter/material.dart';
import 'package:bloc_simple_example/blocs/imc/bloc.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var bloc = ImcBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppBar(
                leading: const Icon(Icons.healing_outlined, color: Colors.white),

                elevation: 0, // Remover a sombra da AppBar interna
                centerTitle: true,
                title: const Text(
                  "Cálculo de IMC",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                backgroundColor: Colors.transparent, // Fazer a AppBar interna transparente
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Altura (cm)",
                    ),
                    controller: bloc.heightCtrl,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Peso (kg)",
                    ),
                    controller: bloc.weightCtrl,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    bloc.result,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: FloatingActionButton(
                    backgroundColor: Colors.pink,
                    child: const Text(
                      "Calcular",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        bloc.calculate();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
