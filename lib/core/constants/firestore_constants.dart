// ignore_for_file: non_constant_identifier_names

final class FirestoreConstants {
  static const String FLOWERS_COLLECTION = 'flowers';
  static String FLOWERS_DOCUMENT(String doc) => '$FLOWERS_COLLECTION/$doc';
  static const String USERS_COLLECTION = 'users';
  static String USERS_DOCUMENT(String doc) => '$USERS_COLLECTION/$doc';

  static const String ORDERS_COLLECTION = 'orders';
  static const String MAIL_COLLECTION = 'mail';

  static const String CONFIGS_COLLECTION = 'configs';
  static const String EMAIL_DOCUMENT = 'email';
}
