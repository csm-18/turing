import 'dart:io';
import 'dart:math';

void main() {
  print("WELCOME TO TURING");
  print("""ENTER OPTION:
   1. Encryption
   2. Decryption
   3. Generate Keys""");
  String? option = stdin.readLineSync();
  switch (option) {
    case "1":
      print("Enter Public Key:");
      String? public_key = stdin.readLineSync();
      if (public_key == null) {
        print("NO PUBLIC KEY PROVIDED!");
        exit(1);
      }
      var private_key = int.parse(public_key[0]) +
          int.parse(public_key[1]) * int.parse(public_key[2]);
      print("Enter Message:");
      String? message = stdin.readLineSync();
      if (message == null) {
        message = "";
      }
      String encrypted_msg = "";
      for (var char in message.split("")) {
        encrypted_msg += (char.codeUnitAt(0) + private_key).toString();
        encrypted_msg += " ";
      }
      print("Encrypted Message:");
      print(encrypted_msg);
      break;
    case "2":
      print("Enter Private Key:");
      var private_key = stdin.readLineSync();
      if (private_key == null) {
        print("NO PRIVATE KEY PROVIDED!");
        exit(1);
      }
      print("Enter Encrypted Message:");
      var enrypted_msg = stdin.readLineSync();
      if (enrypted_msg == null) {
        print("NO ENCRYPTED MESSAGE PROVIDED!");
        exit(1);
      }
      var decrypted_msg = "";
      for (var str in enrypted_msg.split(" ")) {
        decrypted_msg +=
            String.fromCharCode(int.parse(str) - int.parse(private_key));
      }
      print("DECRYPTED MESSAGE:");
      print(decrypted_msg);
      break;
    case "3":
      print("Generating Public and Private Keys:");
      var public_key =
          "${Random().nextInt(10)}${Random().nextInt(10)}${Random().nextInt(10)}";
      var private_key = int.parse(public_key[0]) +
          int.parse(public_key[1]) * int.parse(public_key[2]);
      print("public key: $public_key");
      print("private key: $private_key");
      break;
    default:
      print("NOT A VALID OPTION!");
      exit(1);
  }
}
