import 'package:flutter/cupertino.dart';

class ImcBloc {
  final TextEditingController heightCtrl = TextEditingController();
  final TextEditingController weightCtrl = TextEditingController();
  String result = "Preencha os dados para calcular seu IMC";

  ImcBloc() {
    heightCtrl.addListener(calculate);
    weightCtrl.addListener(calculate);
  }

  calculate() {
    double weight = double.tryParse(weightCtrl.text.replaceAll(',', '.')) ?? 0.0;
    double height = double.tryParse(heightCtrl.text.replaceAll(',', '.')) ?? 0.0 / 100;
    double imc = weight / (height * height);

    if (imc < 18.6) {
      result = "Abaixo do Peso (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 18.6 && imc <= 24.9) {
      result = "Peso Ideal (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 24.9 && imc <= 29.9) {
      result = "Levemente acima do peso (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 24.9 && imc <= 34.9) {
      result = "Obesidade Grau I (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 34.9 && imc <= 39.9) {
      result = "Obesidade Grau II (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 40) {
      result = "Obesidade Grau III (${imc.toStringAsPrecision(2)})";
    }
  }
}
