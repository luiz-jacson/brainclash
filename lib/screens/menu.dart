import "dart:io";

import "package:brainclash/screens/quiz_screen.dart";

void menu() {
  print("Bem vindo ao BrainClash! Selecione uma opção para começar: ");
  print("1 - Jogar");
  print("2 - Sair!");
  var escolha = stdin.readLineSync();
  switch (escolha) {
    case '1':
      inicializaQuiz();
      break;
    case '2':
      break;
    default:
      print('Opção Inválida');
      menu();
  }
}
