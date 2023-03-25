import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart' as material;
import 'package:crypto/crypto.dart';
import 'dart:convert';

class CryptoUtils {

  static final String ENCRYPTION_IV = "0123456789abcdef";
  static final String PADDING = "AES/CBC/PKCS5Padding";
  static final String ALGORITHM = "AES";
  static final String CHARTSET = "UTF-8";




  /**
   * Encryption
   *
   * @param textToEncrypt
   * @param key
   * @return
   */
  /*static String encrypt(final String textToEncrypt, final String key) {
    try {
      final Cipher cipher = Cipher.getInstance(PADDING);
      cipher.init(Cipher.ENCRYPT_MODE, makeKey(key), makeIv());
      return new String(Base64.encodeBase64(cipher.doFinal(textToEncrypt.getBytes())));
    } catch (final Exception e) {
    throw new RuntimeException(e);
    }
  }*/

  static String? encrypt(final String textToEncrypt, final String strKey) {
    final Key key = Key.fromBase64(strKey);
    final IV iv = IV.fromUtf8(ENCRYPTION_IV);
    final Encrypter encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    final encrypted = encrypter.encrypt(textToEncrypt, iv: iv);

    /*material.debugPrint('String to encrypt is $textToEncrypt');
    material.debugPrint('String key using to encrypt is $strKey');
    material.debugPrint('Encrypted string is ${encrypted.base64}');*/

    return encrypted.base64;
  }

  /**
   * Decryption
   *
   * @param textToDecrypt
   * @param key
   * @return
   */
  /*static String decrypt(final String textToDecrypt, final String key) {
    try {
      final Cipher cipher = Cipher.getInstance(PADDING);
      cipher.init(Cipher.DECRYPT_MODE, makeKey(key), makeIv());
      return new String(cipher.doFinal(Base64.decodeBase64(textToDecrypt)));
    } catch (final Exception e) {
    throw new RuntimeException(e);
    }
  }*/

  static String? decrypt(final String textToDecrypt, final String strKey) {
    final Key key = Key.fromBase64(strKey);
    final IV iv = IV.fromUtf8(ENCRYPTION_IV);

    final Encrypter encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(textToDecrypt), iv: iv);

    /*material.debugPrint('String to decrypt is $textToDecrypt');
    material.debugPrint('String key using to encrypt is $strKey');
    material.debugPrint('Decrypted string is $decrypted');*/

    return decrypted;
  }

  static String? sha256Checksum(final String textToDecrypt){

    var bytes = utf8.encode(textToDecrypt); // data being hashed
    var  digest = sha256.convert(bytes);
    /*print("Digest as hex string: $digest");
      print("Digest as hex string: ${digest.toString()}");*/
    return digest.toString();
  }

/*static AlgorithmParameterSpec makeIv() {
    try {
      return new IvParameterSpec(ENCRYPTION_IV.getBytes(CHARTSET));
    } catch (final UnsupportedEncodingException e) {
    e.printStackTrace();
    }
    return null;
  }*/

/*static Key makeKey(final String encryptionKey) {
    try {
      final byte[] key = Base64.decodeBase64(encryptionKey);
      return new SecretKeySpec(key, ALGORITHM);
    } catch (final Exception e) {
    e.printStackTrace();
    }
    return null;
  }*/

/*{
  try {
  final Field field = Class.forName("javax.crypto.JceSecurity").getDeclaredField(
  "isRestricted");
  field.setAccessible(true);
  field.set(null, java.lang.Boolean.FALSE);
  } catch (final Exception ex) {
  ex.printStackTrace();
  }
  }*/

/*static String generateMerchantKey() {
    String newKey = null;

    try {
      // Get the KeyGenerator
      final KeyGenerator kgen = KeyGenerator.getInstance("AES");
      kgen.init(256); // 128, 192 and 256 bits available

      // Generate the secret key specs.
      final SecretKey skey = kgen.generateKey();
      final byte[] raw = skey.getEncoded();

      newKey = new String(Base64.encodeBase64(raw));
    } catch (final Exception ex) {
    ex.printStackTrace();
    }

    return newKey;
  }*/
}