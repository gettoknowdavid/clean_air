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
const String kVerificationViewTitle = 'Verify\n"+ your "email';
const String kVerificationViewDesc =
    'You can open your mail application to check for the verification mail we just sent to you.';
const String kConfirmationTitle = 'Email Verified';
const String kConfirmationMessage =
    'Congratulations! Your email has been successfully verified.';

const String kAirQualityErrorMessage =
    'Cannot retrieve the air quality data for this location at the moment. Please try again later.';

const String kAboutApp =
    "CleanAir is an air quality application designed to provide users with real-time air quality data, alerts, and recommendations to help them stay informed and healthy. The app gathers air quality data by connecting to the Air Quality Index (AQI) API from https://aqicn.org, which provides up-to-date and accurate AQI values.\n"
    "With CleanAir, users can monitor the air quality in their area, receive alerts when the air quality is poor, and get tips on how to reduce their exposure to harmful pollutants. The app features a user-friendly interface that allows users to easily view air quality data, track their progress, and receive personalized recommendations based on their location and air quality history.\n"
    "Whether you're a health-conscious individual, an athlete looking to optimize your performance, or simply concerned about the quality of the air you breathe, CleanAir is the perfect app for you. Powered by the latest technology, CleanAir utilizes advanced sensors and algorithms to provide users with accurate and up-to-date air quality data.\n"
    "The app also features a community-driven platform that enables users to share their air quality experiences, exchange tips and insights, and collaborate on efforts to improve air quality in their local communities. At CleanAir, we are committed to promoting a healthy and sustainable lifestyle by providing users with the tools and information they need to make informed decisions about their health and environment.\n"
    "Join our community today and start breathing clean air with CleanAir!";
