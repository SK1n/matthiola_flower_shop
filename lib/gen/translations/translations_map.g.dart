///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'translations.g.dart';

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'cart.notEnoughProducts': return ({required Object value}) => 'Nu sunt suficient produse, maxim ${value}';
			case 'cart.emptyCart': return 'Nu ați adăugat nici un produs in coș';
			case 'cart.total': return 'Total';
			case 'cart.placeOrder': return 'Finalizare comandă';
			case 'cart.priceChanged': return ({required Object value}) => 'Prețul produsului s-a schimbat, preț nou ${value}';
			case 'cart.notEnoughStock': return ({required Object value}) => 'Nu avem suficiente produse, maxim ${value}';
			case 'cart.removeDialog.title': return 'Scoate din coș';
			case 'cart.removeDialog.content': return 'Ești sigur că vrei să scoți acest produs din coș?';
			case 'cart.removeDialog.cancel': return 'Anulează';
			case 'cart.removeDialog.remove': return 'Scoate';
			case 'checkout.title': return 'Finalizare comandă';
			case 'checkout.total': return 'Total';
			case 'checkout.orderPlaced': return 'Comanda a fost plasată cu success';
			case 'checkout.sendOrder': return 'Trimite comanda';
			case 'errors.invalidEmail': return 'Emailul nu este valid sau este formatat incorect.';
			case 'errors.userDisabled': return 'Acest utilizator a fost dezactivat. Vă rugăm să contactați suportul pentru ajutor.';
			case 'errors.userNotFound': return 'Emailul nu a fost găsit, vă rugăm să creați un cont.';
			case 'errors.invalidCredentials': return 'Datele de autentificare sunt invalide, vă rugăm să încercați din nou.';
			case 'errors.wrongPassword': return 'Parola este incorectă, vă rugăm să încercați din nou.';
			case 'errors.operationNotAllowed': return 'Operațiunea nu este permisă. Vă rugăm să contactați suportul.';
			case 'errors.weakPassword': return 'Vă rugăm să introduceți o parolă mai puternică.';
			case 'errors.emailAlreadyInUse': return 'Există deja un cont pentru acel email.';
			case 'errors.permissionDenied': return 'Nu aveți permisiunea de a efectua această operațiune.';
			case 'errors.notFound': return 'Documentul solicitat nu a fost găsit.';
			case 'errors.aborted': return 'Operațiunea a fost anulată din cauza unui conflict.';
			case 'errors.deadlineExceeded': return 'Operațiunea a depășit termenul limită.';
			case 'errors.unavailable': return 'Serviciul Firestore este momentan indisponibil.';
			case 'errors.invalidArgument': return 'Argumentul furnizat este invalid.';
			case 'errors.alreadyExists': return 'Documentul există deja.';
			case 'errors.resourceExhausted': return 'Resursele Firestore au fost epuizate.';
			case 'errors.unauthenticated': return 'Utilizatorul nu este autentificat.';
			case 'errors.failedPrecondition': return 'O condiție prealabilă pentru operațiune nu a fost îndeplinită.';
			case 'errors.dataLoss': return 'A apărut o pierdere de date.';
			case 'errors.internal': return 'A apărut o eroare internă Firestore.';
			case 'errors.outOfRange': return 'Valoarea furnizată este în afara domeniului de aplicare.';
			case 'errors.unknownError': return 'A apărut o excepție necunoscută.';
			case 'errors.permissionsDenied': return 'Permisiunile necesare nu au fost acordate';
			case 'errors.httpCode400': return 'Cerere incorectă';
			case 'errors.httpCode401': return 'Neautorizat';
			case 'errors.httpCode403': return 'Interzis';
			case 'errors.httpCode404': return 'Nu a fost găsit';
			case 'errors.httpCode408': return 'Timp de așteptare al cererii expirat';
			case 'errors.httpCode409': return 'Conflict';
			case 'errors.httpCode429': return 'Prea multe cereri';
			case 'errors.httpCode500': return 'Eroare internă a serverului';
			case 'errors.httpCode503': return 'Serviciu indisponibil';
			case 'errors.serviceDisabled': return 'Serviciile de localizare sunt dezactivate în prezent. Vă rugăm să activați serviciile de localizare în setările dispozitivului pentru a continua.';
			case 'errors.permissionsDeniedForever': return 'Permisiunea de a accesa locația a fost refuzată permanent. Vă rugăm să accesați setările dispozitivului și să activați manual accesul la locație pentru această aplicație.';
			case 'errors.emailOrPasswordEmpty': return 'Emailul sau parola nu pot fi goale.';
			case 'errors.emptySearch': return 'Căutarea nu a dat rezultate';
			case 'errors.deleteError': return 'Nu s-a putut șterge datele';
			case 'errors.writeError': return 'Nu s-a putut salva datele';
			case 'flower_details.description': return 'Descriere';
			case 'flower_details.quantity': return 'Cantitate';
			case 'flower_details.addToCard': return 'Adaugă în coș';
			case 'flower_details.buyNow': return 'Cumpără acum';
			case 'flower_details.title': return ({required Object name, required Object price}) => '${name} ${price} RON';
			case 'flower_details.batchOf': return ({required Object value}) => 'Acest produs se poate cumpăra doar în multiplu de ${value}.';
			case 'flower_details.maxQuantityReached': return 'Cantitatea maximă a fost atinsă. Nu poți adăuga mai multe articole.';
			case 'generic.unknownException': return 'A apărut o eroare necunoscută.';
			case 'generic.search': return 'Căutați după nume';
			case 'generic.title': return 'Matthiola';
			case 'generic.or': return 'Sau';
			case 'generic.required': return 'Acest câmp este obligatoriu';
			case 'generic.price': return ({required Object value}) => '${value} RON';
			case 'generic.addedToCart': return 'Produsul a fost adăugat in coș';
			case 'home.category': return 'Categorie';
			case 'home.threadFlower': return 'Floare la fir';
			case 'home.potFlower': return 'Floare la ghiveci';
			case 'home.home': return 'Acasă';
			case 'home.cart': return 'Coş';
			case 'home.favorite': return 'Favorite';
			case 'home.emptyFavorite': return 'Nu ai adăugat încă produse la favorite.';
			case 'home.profile': return 'Profil';
			case 'home.search': return 'Caută...';
			case 'home.lastProducts': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ro'))(n,
				one: 'Ultimele ${n} bucăți!',
				other: 'Ultimele ${n} de bucăți!',
			);
			case 'home.inStock': return ({required Object value}) => '${value} bucăți în stoc.';
			case 'home.cantRefreshNow': return 'Lista nu poate fi reîmprospătată acum. Încercați din nou în scurt timp.';
			case 'home.welcomeBack': return 'Bine ați revenit,';
			case 'profile.logOut': return 'Delogare';
			case 'profile.deleteAccount': return 'Șterge contul';
			case 'profile.deleteMessage': return 'Ești sigur că vrei să ștergi definitiv contul și toate datele asociate?';
			case 'profile.confirmDelete': return 'Confirmă ștergerea';
			case 'profile.cancelDelete': return 'Anulează';
			case 'reset_password.title': return 'Resetează parola';
			case 'reset_password.emailLabel': return 'Introduceți adresa de email';
			case 'reset_password.emailHint': return 'De exemplu, numeletau@gmail.com';
			case 'reset_password.emailFormat': return 'Format email';
			case 'reset_password.reset': return 'Resetează parola';
			case 'reset_password.emailSent': return ({required Object value}) => 'Un email a fost trimis pentru a reseta parola la adresa de mail: ${value}';
			case 'sign_in.title': return 'Bine ați revenit';
			case 'sign_in.emailLabel': return 'Introduceți adresa dvs. de email';
			case 'sign_in.emailHint': return 'Ex: numele.tau@gmail.com';
			case 'sign_in.emailPrefix': return 'Email';
			case 'sign_in.passwordLabel': return 'Introduceți parola dvs.';
			case 'sign_in.noAccount': return 'Nu aveți încă un cont?';
			case 'sign_in.register': return 'Înregistrați-vă';
			case 'sign_in.signIn': return 'Intră în cont';
			case 'sign_up.title': return 'Crează un cont';
			case 'sign_up.emailLabel': return 'Introduceți adresa de email';
			case 'sign_up.emailHint': return 'De exemplu, numeletau@gmail.com';
			case 'sign_up.passwordLabel': return 'Introduceți parola';
			case 'sign_up.rePasswordLabel': return 'Introduceți din nou parola';
			case 'sign_up.accountCreated': return 'Cont creat!';
			case 'sign_up.usernameLabel': return 'Numele florăriei';
			case 'sign_up.createAccount': return 'Creează cont';
			case 'sign_up.addressLabel': return 'Adresă';
			case 'sign_up.phoneLabel': return 'Număr de telefon';
			case 'validator.passwordShort': return 'Parola trebuie să aibă cel puțin 8 caractere.';
			case 'validator.passwordMissingLetter': return 'Parola trebuie să conțină cel puțin o literă.';
			case 'validator.passwordMissingDigit': return 'Parola trebuie să conțină cel puțin un număr.';
			case 'validator.passwordMismatch': return 'Parolele nu se potrivesc. Vă rugăm să verificați că sunt identice.';
			case 'validator.required': return 'Acest câmp nu poate fi lăsat necompletat.';
			case 'validator.invalidEmail': return 'Vă rugăm să introduceți o adresă de email validă.';
			case 'validator.phoneFormat': return 'Vă rugăm să introduceți un număr de telefon valid. Formate acceptate:\n+40213-564-864\n+40213.564.864\n+40213 564 864\n0213-564-864\n0712456789';
			default: return null;
		}
	}
}

extension on _TranslationsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'cart.notEnoughProducts': return ({required Object value}) => 'Not enough products, maxim ${value}';
			case 'cart.emptyCart': return 'The cart is empty';
			case 'cart.total': return 'Total';
			case 'cart.placeOrder': return 'Checkout';
			case 'cart.priceChanged': return ({required Object value}) => 'The product price has changed, new price ${value}';
			case 'cart.notEnoughStock': return ({required Object value}) => 'There is not enough stock, maximum ${value}';
			case 'cart.removeDialog.title': return 'Remove from cart';
			case 'cart.removeDialog.content': return 'Are you sure you want to remove this product from your cart?';
			case 'cart.removeDialog.cancel': return 'Cancel';
			case 'cart.removeDialog.remove': return 'Remove';
			case 'checkout.title': return 'Checkout';
			case 'checkout.total': return 'Total';
			case 'checkout.orderPlaced': return 'Order place with success';
			case 'checkout.sendOrder': return 'Send order';
			case 'errors.invalidEmail': return 'Email is not valid or badly formatted.';
			case 'errors.userDisabled': return 'This user has been disabled. Please contact support for help.';
			case 'errors.userNotFound': return 'Email is not found, please create an account.';
			case 'errors.invalidCredentials': return 'Invalid credentials, please try again.';
			case 'errors.wrongPassword': return 'Incorrect password, please try again.';
			case 'errors.operationNotAllowed': return 'Operation is not allowed.  Please contact support.';
			case 'errors.weakPassword': return 'Please enter a stronger password.';
			case 'errors.emailAlreadyInUse': return 'An account already exists for that email.';
			case 'errors.permissionDenied': return 'You do not have permission to perform this operation.';
			case 'errors.notFound': return 'The requested document was not found.';
			case 'errors.aborted': return 'The operation was aborted due to a conflict.';
			case 'errors.deadlineExceeded': return 'The operation timed out.';
			case 'errors.unavailable': return 'The Firestore service is currently unavailable.';
			case 'errors.invalidArgument': return 'The provided argument is invalid.';
			case 'errors.alreadyExists': return 'The document already exists.';
			case 'errors.resourceExhausted': return 'Firestore resources have been exhausted.';
			case 'errors.unauthenticated': return 'The user is not authenticated.';
			case 'errors.failedPrecondition': return 'A precondition for the operation was not met.';
			case 'errors.dataLoss': return 'Data loss occurred.';
			case 'errors.internal': return 'An internal Firestore error occurred.';
			case 'errors.outOfRange': return 'The provided value is out of range.';
			case 'errors.unknownError': return 'An unknown exception occurred.';
			case 'errors.permissionsDenied': return 'Permissions denied';
			case 'errors.httpCode400': return 'Bad Request';
			case 'errors.httpCode401': return 'Unauthorized';
			case 'errors.httpCode403': return 'Forbidden';
			case 'errors.httpCode404': return 'Not Found';
			case 'errors.httpCode408': return 'Request Timeout';
			case 'errors.httpCode409': return 'Conflict';
			case 'errors.httpCode429': return 'Too Many Requests';
			case 'errors.httpCode500': return 'Internal Server Error';
			case 'errors.httpCode503': return 'Service Unavailable';
			case 'errors.serviceDisabled': return 'Location services are currently disabled. Please enable location services in your device settings to proceed.';
			case 'errors.permissionsDeniedForever': return 'Permission to access location has been permanently denied. Please go to your device settings and manually enable location access for this app.';
			case 'errors.emailOrPasswordEmpty': return 'Email or password cannot be empty.';
			case 'errors.emptySearch': return 'The search found 0 results';
			case 'errors.deleteError': return 'Couldn\'t delete data';
			case 'errors.writeError': return 'Coudln\'t write data';
			case 'flower_details.description': return 'Description';
			case 'flower_details.quantity': return 'Quantity';
			case 'flower_details.addToCard': return 'Add to cart';
			case 'flower_details.buyNow': return 'Buy now';
			case 'flower_details.title': return ({required Object name, required Object price}) => '${name} ${price} RON';
			case 'flower_details.batchOf': return ({required Object value}) => 'This product can only be purchased in multiples of ${value}.';
			case 'flower_details.maxQuantityReached': return 'Maximum quantity reached. You cannot add more items.';
			case 'generic.unknownException': return 'An unknown exception occurred.';
			case 'generic.search': return 'Search by name';
			case 'generic.title': return 'Matthiola';
			case 'generic.or': return 'Or';
			case 'generic.required': return 'This field is required';
			case 'generic.price': return ({required Object value}) => '${value} RON';
			case 'generic.addedToCart': return 'Product added to cart';
			case 'home.category': return 'Category';
			case 'home.threadFlower': return 'Thread Flower';
			case 'home.potFlower': return 'Potted Flower';
			case 'home.home': return 'Home';
			case 'home.cart': return 'Cart';
			case 'home.favorite': return 'Favorites';
			case 'home.emptyFavorite': return 'You haven\'t added any favorite products yet.';
			case 'home.profile': return 'Profile';
			case 'home.search': return 'Search...';
			case 'home.lastProducts': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				one: 'Last ${n} pieces!',
				other: 'Last ${n} pieces!',
			);
			case 'home.inStock': return ({required Object value}) => '${value} items in stock';
			case 'home.cantRefreshNow': return 'The list can\'t be refreshed right now. Please try again shortly.';
			case 'home.welcomeBack': return 'Welcome back,';
			case 'profile.logOut': return 'Log out';
			case 'profile.deleteAccount': return 'Delete account';
			case 'profile.deleteMessage': return 'Are you sure you want to permanently delete your account and all associated data?';
			case 'profile.confirmDelete': return 'Confirm deletion';
			case 'profile.cancelDelete': return 'Cancel';
			case 'reset_password.title': return 'Reset your password';
			case 'reset_password.emailSent': return ({required Object value}) => 'An email has been sent to reset the password to ${value}';
			case 'reset_password.emailFormat': return 'Email format';
			case 'reset_password.emailLabel': return 'Enter your email address';
			case 'reset_password.reset': return 'Reset your password';
			case 'reset_password.emailHint': return 'E.g. yourname@gmail.com';
			case 'sign_in.title': return 'Welcome back';
			case 'sign_in.emailLabel': return 'Enter your email address';
			case 'sign_in.emailHint': return 'E.g. yourname@gmail.com';
			case 'sign_in.emailPrefix': return 'Email';
			case 'sign_in.passwordLabel': return 'Enter your password';
			case 'sign_in.noAccount': return 'Don\'t have an account yet?';
			case 'sign_in.register': return 'Register';
			case 'sign_in.signIn': return 'Sign In';
			case 'sign_up.title': return 'Create an Account';
			case 'sign_up.emailLabel': return 'Enter your email address';
			case 'sign_up.emailHint': return 'E.g. yourname@gmail.com';
			case 'sign_up.passwordLabel': return 'Enter your password';
			case 'sign_up.rePasswordLabel': return 'Re-enter your password';
			case 'sign_up.accountCreated': return 'Account created!';
			case 'sign_up.usernameLabel': return 'Flower Shop Name';
			case 'sign_up.createAccount': return 'Create Account';
			case 'sign_up.addressLabel': return 'Address';
			case 'sign_up.phoneLabel': return 'Phone Number';
			case 'validator.passwordShort': return 'Password must be at least 8 characters long.';
			case 'validator.passwordMissingLetter': return 'Password must include at least one letter.';
			case 'validator.passwordMissingDigit': return 'Password must include at least one number.';
			case 'validator.passwordMismatch': return 'Passwords do not match. Please make sure both entries are identical.';
			case 'validator.required': return 'This field cannot be left empty.';
			case 'validator.invalidEmail': return 'Please enter a valid email address.';
			case 'validator.phoneFormat': return 'Please enter a valid phone number. Accepted formats:\n+40213-564-864\n+40213.564.864\n+40213 564 864\n0213-564-864\n0712456789';
			default: return null;
		}
	}
}
