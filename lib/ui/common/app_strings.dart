const String kLoadingAsset = 'assets/loading.json';
const String kOnboardingAsset1 = 'assets/images/onboarding_1.png';
const String kOnboardingAsset2 = 'assets/images/onboarding_2.png';
const String kOnboardingAsset3 = 'assets/images/onboarding_3.png';

const String kDBName = '__plansteria__';

const String emailRegex =
    r"""^[\w!#$%&\'*+/=?^_`{|}~-]+(?:\.[\w!#$%&\'*+/=?^_`{|}~-]+)*@(?:[\w-]+\.)+[\w]{2,}$""";
const String passwordRegex =
    r"""^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!])(?=.{8,})""";

const String kAuthUser = '_authenticated_user__';

const String kInvalidEmail = 'Invalid email.';
const String kServerErrorMessage = 'There seems to be an error, try again.';
const String kInvalidEmailPassword = 'Invalid email or password.';
const String kEmailAlreadyInUseErrorMessage = 'Email already in use.';
const String kNoUserFoundErrorMessage = 'No user found with this email.';
const String kNoNetworkConnectionError =
    'Please check your internet connection or try again later.';

const String kMailAppTitle = 'Your mail apps';
const String kMailAppDescription =
    'Please select your preferred mail application.';

const String kNoMailAppTitle = 'Oops!';
const String kNoMailAppDescription = 'No mail apps found.';

const String kVerificationEmailSentSuccess = 'Verification email sent';
const String kVerificationViewTitle = 'Verify your \nemail';
const String kVerificationViewDesc =
    'You can open your mail application to check for the verification mail we just sent to you.';
const String kConfirmationTitle = 'Email Verified';
const String kConfirmationMessage =
    'Congratulations! Your email has been successfully verified.';

const String kAirQualityErrorMessage =
    'Cannot retrieve the air quality data for this location at the moment. Please try again later.';
