import "dart:io";

void menu(){
  print("Bem vindo ao BrainClash! Escolha um modo de jogo para começar!:");
  print("1 - Solo quizz");
  print("2 - Multiplayer (to be developed)");
  print("3 - Sair");
  String input = stdin.readLineSync()!;
  if(input == '3'){
    return;
  }
  else if(input == '2'){
    print("To be developed");
    print("                     ");
    menu();
  }else if(input == '1'){
    
  }else{
    menu();
  }
}