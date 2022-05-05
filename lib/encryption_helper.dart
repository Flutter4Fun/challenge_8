import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';

class EncryptionHelper {
  static final _iv = IV(Uint8List.fromList([1]));
  static final _key = Key.fromUtf8("G-KaPdSgUkXp2s5v");
  static Future<Uint8List> encrypt(Uint8List data) async {
    return AES(_key).encrypt(data, iv: _iv).bytes;
  }

  static Future<Uint8List> decrypt(Uint8List encrypted) async {
    return AES(_key).decrypt(Encrypted(encrypted), iv: _iv);
  }
}