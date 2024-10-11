///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'translations.g.dart';

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ro,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ro>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _TranslationsCartRo cart = _TranslationsCartRo._(_root);
	late final _TranslationsCheckoutRo checkout = _TranslationsCheckoutRo._(_root);
	late final _TranslationsErrorsRo errors = _TranslationsErrorsRo._(_root);
	late final _TranslationsFlowerDetailsRo flower_details = _TranslationsFlowerDetailsRo._(_root);
	late final _TranslationsGenericRo generic = _TranslationsGenericRo._(_root);
	late final _TranslationsHomeRo home = _TranslationsHomeRo._(_root);
	late final _TranslationsProfileRo profile = _TranslationsProfileRo._(_root);
	late final _TranslationsResetPasswordRo reset_password = _TranslationsResetPasswordRo._(_root);
	late final _TranslationsSignInRo sign_in = _TranslationsSignInRo._(_root);
	late final _TranslationsSignUpRo sign_up = _TranslationsSignUpRo._(_root);
}

// Path: cart
class _TranslationsCartRo {
	_TranslationsCartRo._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String notEnoughProducts({required Object value}) => 'Nu sunt suficient produse, maxim ${value}';
	String get emptyCart => 'Nu ați adăugat nici un produs in coș';
	String get total => 'Total';
	String get placeOrder => 'Finalizare comandă';
	String priceChanged({required Object value}) => 'Pretul produsului s-a schimba, pret nou ${value}';
	String notEnoughStock({required Object value}) => 'Nu este suficent stock, maxim ${value}';
}

// Path: checkout
class _TranslationsCheckoutRo {
	_TranslationsCheckoutRo._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Finalizare comandă';
	String get total => 'Total';
	String get orderPlaced => 'Comanda a fost plasată cu success';
	String get sendOrder => 'Trimite comanda';
}

// Path: errors
class _TranslationsErrorsRo {
	_TranslationsErrorsRo._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get invalidEmail => 'Emailul nu este valid sau este formatat incorect.';
	String get userDisabled => 'Acest utilizator a fost dezactivat. Vă rugăm să contactați suportul pentru ajutor.';
	String get userNotFound => 'Emailul nu a fost găsit, vă rugăm să creați un cont.';
	String get invalidCredentials => 'Datele de autentificare sunt invalide, vă rugăm să încercați din nou.';
	String get wrongPassword => 'Parola este incorectă, vă rugăm să încercați din nou.';
	String get operationNotAllowed => 'Operațiunea nu este permisă. Vă rugăm să contactați suportul.';
	String get weakPassword => 'Vă rugăm să introduceți o parolă mai puternică.';
	String get emailAlreadyInUse => 'Există deja un cont pentru acel email.';
	String get permissionDenied => 'Nu aveți permisiunea de a efectua această operațiune.';
	String get notFound => 'Documentul solicitat nu a fost găsit.';
	String get aborted => 'Operațiunea a fost anulată din cauza unui conflict.';
	String get deadlineExceeded => 'Operațiunea a depășit termenul limită.';
	String get unavailable => 'Serviciul Firestore este momentan indisponibil.';
	String get invalidArgument => 'Argumentul furnizat este invalid.';
	String get alreadyExists => 'Documentul există deja.';
	String get resourceExhausted => 'Resursele Firestore au fost epuizate.';
	String get unauthenticated => 'Utilizatorul nu este autentificat.';
	String get failedPrecondition => 'O condiție prealabilă pentru operațiune nu a fost îndeplinită.';
	String get dataLoss => 'A apărut o pierdere de date.';
	String get internal => 'A apărut o eroare internă Firestore.';
	String get outOfRange => 'Valoarea furnizată este în afara domeniului de aplicare.';
	String get unknownError => 'A apărut o excepție necunoscută.';
	String get permissionsDenied => 'Permisiunile necesare nu au fost acordate';
	String get httpCode400 => 'Cerere incorectă';
	String get httpCode401 => 'Neautorizat';
	String get httpCode403 => 'Interzis';
	String get httpCode404 => 'Nu a fost găsit';
	String get httpCode408 => 'Timp de așteptare al cererii expirat';
	String get httpCode409 => 'Conflict';
	String get httpCode429 => 'Prea multe cereri';
	String get httpCode500 => 'Eroare internă a serverului';
	String get httpCode503 => 'Serviciu indisponibil';
	String get serviceDisabled => 'Serviciile de localizare sunt dezactivate în prezent. Vă rugăm să activați serviciile de localizare în setările dispozitivului pentru a continua.';
	String get permissionsDeniedForever => 'Permisiunea de a accesa locația a fost refuzată permanent. Vă rugăm să accesați setările dispozitivului și să activați manual accesul la locație pentru această aplicație.';
	String get emailOrPasswordEmpty => 'Emailul sau parola nu pot fi goale.';
	String get emptySearch => 'Căutarea nu a dat rezultate';
	String get deleteError => 'Nu s-a putut șterge datele';
	String get writeError => 'Nu s-a putut salva datele';
}

// Path: flower_details
class _TranslationsFlowerDetailsRo {
	_TranslationsFlowerDetailsRo._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get description => 'Descriere';
	String get quantity => 'Cantitate';
	String get addToCard => 'Adaugă în coș';
	String get buyNow => 'Cumpără acum';
	String title({required Object name, required Object price}) => '${name} ${price} RON';
	String batchOf({required Object value}) => 'Acest produs se poate cumpăra doar în multiplu de ${value}.';
	String get maxQuantityReached => 'Cantitatea maximă a fost atinsă. Nu poți adăuga mai multe articole.';
}

// Path: generic
class _TranslationsGenericRo {
	_TranslationsGenericRo._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get unknownException => 'A apărut o eroare necunoscută.';
	String get search => 'Căutați după nume';
	String get title => 'Matthiola';
	String get or => 'Sau';
	String get required => 'Acest câmp este obligatoriu';
	String price({required Object value}) => '${value} RON';
	String get addedToCart => 'Produsul a fost adăugat in coș';
}

// Path: home
class _TranslationsHomeRo {
	_TranslationsHomeRo._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get category => 'Categorie';
	String get threadFlower => 'Floare la fir';
	String get potFlower => 'Floare la ghiveci';
	String get home => 'Acasă';
	String get cart => 'Coş';
	String get favorite => 'Favorite';
	String get emptyFavorite => 'Nu ai adăugat încă produse la favorite.';
	String get profile => 'Profil';
	String get search => 'Caută...';
	String lastProducts({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ro'))(n,
		one: 'Ultimele ${n} bucăți!',
		other: 'Ultimele ${n} de bucăți!',
	);
	String inStock({required Object value}) => '${value} bucăți în stoc.';
}

// Path: profile
class _TranslationsProfileRo {
	_TranslationsProfileRo._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get logOut => 'Delogare';
	String get deleteAccount => 'Șterge contul';
	String get deleteMessage => 'Ești sigur că vrei să ștergi definitiv contul și toate datele asociate?';
	String get confirmDelete => 'Confirmă ștergerea';
	String get cancelDelete => 'Anulează';
}

// Path: reset_password
class _TranslationsResetPasswordRo {
	_TranslationsResetPasswordRo._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Resetează parola';
	String get emailLabel => 'Introduceți adresa de email';
	String get emailHint => 'De exemplu, numeletau@gmail.com';
	String get emailFormat => 'Format email';
	String get reset => 'Resetează parola';
	String emailSent({required Object value}) => 'Un email a fost trimis pentru a reseta parola la adresa de mail: ${value}';
}

// Path: sign_in
class _TranslationsSignInRo {
	_TranslationsSignInRo._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Bun venit înapoi';
	String get emailLabel => 'Introduceți adresa de email';
	String get emailHint => 'De exemplu, numeletau@gmail.com';
	String get emailIsValid => 'Emailul este valid';
	String get emailFormat => 'Format email';
	String get emailPrefix => 'Email';
	String get passwordLabel => 'Introduceți parola';
	String get passwordShort => 'Cel puțin 8 caractere.';
	String get passwordPrefix => 'Parolă';
	String get passwordMissingLetter => 'Cel puțin 1 literă.';
	String get passwordMissingDigit => 'Cel puțin 1 cifră.';
	String get noAccount => 'Nu aveți încă un cont?';
	String get register => 'Înregistrați-vă';
	String get signIn => 'Autentificare';
	String get signInWithGoogle => 'Autentificare cu Google';
}

// Path: sign_up
class _TranslationsSignUpRo {
	_TranslationsSignUpRo._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Crează un cont';
	String get emailLabel => 'Introduceți adresa de email';
	String get emailHint => 'De exemplu, numeletau@gmail.com';
	String get emailIsValid => 'Emailul este valid';
	String get emailFormat => 'Format email';
	String get passwordLabel => 'Introduceți parola';
	String get passwordShort => 'Cel puțin 8 caractere.';
	String get passwordMissingLetter => 'Cel puțin 1 literă.';
	String get passwordMissingDigit => 'Cel puțin 1 cifră.';
	String get rePasswordLabel => 'Introduceți din nou parola';
	String get passwordMismatch => 'Parolele nu se potrivesc';
	String get accountCreated => 'Cont creat!';
	String get usernameLabel => 'Numele florăriei';
	String get required => 'Acest câmp este obligatoriu';
	String get createAccount => 'Creează cont';
	String get addressLabel => 'Adresă';
	String get phoneLabel => 'Număr de telefon';
	String get phoneFormat => 'Format greșit al numărului de telefon\nAcceptăm următoarele:\n+40213-564-864\n+40213.564.864\n+40213 564 864\n0213-564-864\n0712456789';
}
