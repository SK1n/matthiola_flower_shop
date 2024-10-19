///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'translations.g.dart';

// Path: <root>
class _TranslationsEn implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _TranslationsEn _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsCartEn cart = _TranslationsCartEn._(_root);
	@override late final _TranslationsCheckoutEn checkout = _TranslationsCheckoutEn._(_root);
	@override late final _TranslationsErrorsEn errors = _TranslationsErrorsEn._(_root);
	@override late final _TranslationsFlowerDetailsEn flower_details = _TranslationsFlowerDetailsEn._(_root);
	@override late final _TranslationsGenericEn generic = _TranslationsGenericEn._(_root);
	@override late final _TranslationsHomeEn home = _TranslationsHomeEn._(_root);
	@override late final _TranslationsProfileEn profile = _TranslationsProfileEn._(_root);
	@override late final _TranslationsResetPasswordEn reset_password = _TranslationsResetPasswordEn._(_root);
	@override late final _TranslationsSignInEn sign_in = _TranslationsSignInEn._(_root);
	@override late final _TranslationsSignUpEn sign_up = _TranslationsSignUpEn._(_root);
	@override late final _TranslationsValidatorEn validator = _TranslationsValidatorEn._(_root);
}

// Path: cart
class _TranslationsCartEn implements _TranslationsCartRo {
	_TranslationsCartEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String notEnoughProducts({required Object value}) => 'Not enough products, maxim ${value}';
	@override String get emptyCart => 'The cart is empty';
	@override String get total => 'Total';
	@override String get placeOrder => 'Checkout';
	@override String priceChanged({required Object value}) => 'The product price has changed, new price ${value}';
	@override String notEnoughStock({required Object value}) => 'There is not enough stock, maximum ${value}';
	@override late final _TranslationsCartRemoveDialogEn removeDialog = _TranslationsCartRemoveDialogEn._(_root);
}

// Path: checkout
class _TranslationsCheckoutEn implements _TranslationsCheckoutRo {
	_TranslationsCheckoutEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Checkout';
	@override String get total => 'Total';
	@override String get orderPlaced => 'Order place with success';
	@override String get sendOrder => 'Send order';
}

// Path: errors
class _TranslationsErrorsEn implements _TranslationsErrorsRo {
	_TranslationsErrorsEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get invalidEmail => 'Email is not valid or badly formatted.';
	@override String get userDisabled => 'This user has been disabled. Please contact support for help.';
	@override String get userNotFound => 'Email is not found, please create an account.';
	@override String get invalidCredentials => 'Invalid credentials, please try again.';
	@override String get wrongPassword => 'Incorrect password, please try again.';
	@override String get operationNotAllowed => 'Operation is not allowed.  Please contact support.';
	@override String get weakPassword => 'Please enter a stronger password.';
	@override String get emailAlreadyInUse => 'An account already exists for that email.';
	@override String get permissionDenied => 'You do not have permission to perform this operation.';
	@override String get notFound => 'The requested document was not found.';
	@override String get aborted => 'The operation was aborted due to a conflict.';
	@override String get deadlineExceeded => 'The operation timed out.';
	@override String get unavailable => 'The Firestore service is currently unavailable.';
	@override String get invalidArgument => 'The provided argument is invalid.';
	@override String get alreadyExists => 'The document already exists.';
	@override String get resourceExhausted => 'Firestore resources have been exhausted.';
	@override String get unauthenticated => 'The user is not authenticated.';
	@override String get failedPrecondition => 'A precondition for the operation was not met.';
	@override String get dataLoss => 'Data loss occurred.';
	@override String get internal => 'An internal Firestore error occurred.';
	@override String get outOfRange => 'The provided value is out of range.';
	@override String get unknownError => 'An unknown exception occurred.';
	@override String get permissionsDenied => 'Permissions denied';
	@override String get httpCode400 => 'Bad Request';
	@override String get httpCode401 => 'Unauthorized';
	@override String get httpCode403 => 'Forbidden';
	@override String get httpCode404 => 'Not Found';
	@override String get httpCode408 => 'Request Timeout';
	@override String get httpCode409 => 'Conflict';
	@override String get httpCode429 => 'Too Many Requests';
	@override String get httpCode500 => 'Internal Server Error';
	@override String get httpCode503 => 'Service Unavailable';
	@override String get serviceDisabled => 'Location services are currently disabled. Please enable location services in your device settings to proceed.';
	@override String get permissionsDeniedForever => 'Permission to access location has been permanently denied. Please go to your device settings and manually enable location access for this app.';
	@override String get emailOrPasswordEmpty => 'Email or password cannot be empty.';
	@override String get emptySearch => 'The search found 0 results';
	@override String get deleteError => 'Couldn\'t delete data';
	@override String get writeError => 'Coudln\'t write data';
}

// Path: flower_details
class _TranslationsFlowerDetailsEn implements _TranslationsFlowerDetailsRo {
	_TranslationsFlowerDetailsEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get description => 'Description';
	@override String get quantity => 'Quantity';
	@override String get addToCard => 'Add to cart';
	@override String get buyNow => 'Buy now';
	@override String title({required Object name, required Object price}) => '${name} ${price} RON';
	@override String batchOf({required Object value}) => 'This product can only be purchased in multiples of ${value}.';
	@override String get maxQuantityReached => 'Maximum quantity reached. You cannot add more items.';
}

// Path: generic
class _TranslationsGenericEn implements _TranslationsGenericRo {
	_TranslationsGenericEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get unknownException => 'An unknown exception occurred.';
	@override String get search => 'Search by name';
	@override String get title => 'Matthiola';
	@override String get or => 'Or';
	@override String get required => 'This field is required';
	@override String price({required Object value}) => '${value} RON';
	@override String get addedToCart => 'Product added to cart';
}

// Path: home
class _TranslationsHomeEn implements _TranslationsHomeRo {
	_TranslationsHomeEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get category => 'Category';
	@override String get threadFlower => 'Thread Flower';
	@override String get potFlower => 'Potted Flower';
	@override String get home => 'Home';
	@override String get cart => 'Cart';
	@override String get favorite => 'Favorites';
	@override String get emptyFavorite => 'You haven\'t added any favorite products yet.';
	@override String get profile => 'Profile';
	@override String get search => 'Search...';
	@override String lastProducts({required Object n}) => '${n} left';
	@override String inStock({required Object value}) => '${value} items in stock';
	@override String get cantRefreshNow => 'The list can\'t be refreshed right now. Please try again shortly.';
	@override String get welcomeBack => 'Welcome back,';
}

// Path: profile
class _TranslationsProfileEn implements _TranslationsProfileRo {
	_TranslationsProfileEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get logOut => 'Log out';
	@override String get deleteAccount => 'Delete account';
	@override String get deleteMessage => 'Are you sure you want to permanently delete your account and all associated data?';
	@override String get confirmDelete => 'Confirm deletion';
	@override String get cancelDelete => 'Cancel';
}

// Path: reset_password
class _TranslationsResetPasswordEn implements _TranslationsResetPasswordRo {
	_TranslationsResetPasswordEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Reset your password';
	@override String emailSent({required Object value}) => 'An email has been sent to reset the password to ${value}';
	@override String get emailFormat => 'Email format';
	@override String get emailLabel => 'Enter your email address';
	@override String get reset => 'Reset your password';
	@override String get emailHint => 'E.g. yourname@gmail.com';
}

// Path: sign_in
class _TranslationsSignInEn implements _TranslationsSignInRo {
	_TranslationsSignInEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Welcome back';
	@override String get emailLabel => 'Enter your email address';
	@override String get emailHint => 'E.g. yourname@gmail.com';
	@override String get emailPrefix => 'Email';
	@override String get passwordLabel => 'Enter your password';
	@override String get noAccount => 'Don\'t have an account yet?';
	@override String get register => 'Register';
	@override String get signIn => 'Sign In';
}

// Path: sign_up
class _TranslationsSignUpEn implements _TranslationsSignUpRo {
	_TranslationsSignUpEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Create an Account';
	@override String get emailLabel => 'Enter your email address';
	@override String get emailHint => 'E.g. yourname@gmail.com';
	@override String get passwordLabel => 'Enter your password';
	@override String get rePasswordLabel => 'Re-enter your password';
	@override String get accountCreated => 'Account created!';
	@override String get usernameLabel => 'Flower Shop Name';
	@override String get createAccount => 'Create Account';
	@override String get addressLabel => 'Address';
	@override String get phoneLabel => 'Phone Number';
}

// Path: validator
class _TranslationsValidatorEn implements _TranslationsValidatorRo {
	_TranslationsValidatorEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get passwordShort => 'Password must be at least 8 characters long.';
	@override String get passwordMissingLetter => 'Password must include at least one letter.';
	@override String get passwordMissingDigit => 'Password must include at least one number.';
	@override String get passwordMismatch => 'Passwords do not match. Please make sure both entries are identical.';
	@override String get required => 'This field cannot be left empty.';
	@override String get invalidEmail => 'Please enter a valid email address.';
	@override String get phoneFormat => 'Please enter a valid phone number. Accepted formats:\n+40213-564-864\n+40213.564.864\n+40213 564 864\n0213-564-864\n0712456789';
}

// Path: cart.removeDialog
class _TranslationsCartRemoveDialogEn implements _TranslationsCartRemoveDialogRo {
	_TranslationsCartRemoveDialogEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Remove from cart';
	@override String get content => 'Are you sure you want to remove this product from your cart?';
	@override String get cancel => 'Cancel';
	@override String get remove => 'Remove';
}
