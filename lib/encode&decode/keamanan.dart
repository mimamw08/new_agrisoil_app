import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

String encryptAES(String plaintext, String keyString) {
  final key = Key.fromUtf8(keyString.substring(0, 16));
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final encrypted = encrypter.encrypt(plaintext, iv: iv);
  return base64.encode(encrypted.bytes);
}

String decryptAES(String ciphertext, String keyString) {
  final key = Key.fromUtf8(keyString.substring(0, 16));
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final decrypted =
      encrypter.decrypt(Encrypted(base64.decode(ciphertext)), iv: iv);
  return decrypted;
}
