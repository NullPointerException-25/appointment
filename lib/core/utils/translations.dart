import 'package:get/get.dart';

class Translator extends Translations {

  static String get appName => 'Appointments Manager';

  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'title': 'Appointments Manager',
          'setup': 'Setup',
          'home': 'Home',
          'login': 'Login',
          "Let's String get started": "Let's String get started",
          "What's your name?": "What's your name?",
          "Name": "Name",
          "Next": "Next",
          "Continue without image": "Continue without image",
          "No, thanks": "No, thanks",
          "Choose you profile image": "Choose you profile image",
          "Receive emails of new features?": "Receive emails of new features?",
          "Please enter some text": "Please enter some text",
          'Please enter a valid email': 'Please enter a valid email',
          'Email': 'Email',
          "Finish": "Finish",
          "Welcome": "Welcome back,",
          "Today's total appointments": "Today's total appointments",
          "name": "Name",
          "email": "Email",
          "phone": "Phone",
          "description": "Description",
          "save": "Save",
          "create_client": "Create Client",
          "descriptionHint":
              "Give a general description of the client or any other information you want to keep",
          "unSelectImage": "Unselect Image",
          "selectImage": "Select Image",
          "enterValidPhone": "Please enter a valid phone number",
          "filters": "Filters",
          "viewProfile": "View profile",
          "quickCall": "Quick call",
          "scheduleAppointment": "Schedule appointment",
          "clientsNotFound":"Your clients must be here, but at least we found a cat",
          "addClient": "Add a client",
          "minutes": "@minutes minutes",
          "hourMinutes": "@hours hours and @minutes minutes",
          "hour": "@hours hours",
          "newAppointment": "New appointment",
          "noClientsFound": "No clients found",
          "tapToAddClient": "Tap to add a client",
          "newClient": "New client",
          "clientName": "Client name",
          "appointmentsDate": "Appointment date",
          "addANewField": "Add a new field",
          "month": "Month",
          "week": "Week",
          "day": "Day",
          "today": "Today",
          "tomorrow": "Tomorrow",
          "yesterday": "Yesterday",
          "twoWeeks": "Two weeks",
          "appointmentCreated": "Appointment created",
          "today'sAppointments": "Today's appointments",
          "calendar": "Calendar",
          "nameIsRequired": "Name cannot be empty",
          "nothingForToday": "No appointments today",
          "addNewField": "Add new field",
          "customFields": "Custom fields",
          "duration": "Duration",
          "preview": "Preview",
          "number": "Number",
          "imageList": "Image list",
          "audio": "Audio",
          "video": "Video",
          "file": "File",
          "date": "Date",
          "pleaseSelectAClient": "Please select a client",
          "selectAppointment": "Please select an appointment",
          "pleaseEnterATitle": "Please enter a title",
           "shortText": "Short text",
          "largeText": "Large text",
          "phoneNumber": "Phone number",
          "images": "Images",
          "removeField": "Remove field",
          "somethingWentWrong": "Something went wrong",
          "signUp": "Sign up",
          "password": "Password",
          "continueWithoutAccount": "Continue without account",
          "passwordTooShort": "Password must be at least 8 characters long",
          "passwordNotMatch": "Passwords do not match",
          "confirmPassword": "Confirm password",
          "youCanCreateAccountLater": "Don't worry, You can create and link an account later",
          "letsGetStarted": "Let's get started",
          "whatsYourName": "What's your name?",
          "savedAccounts": "Saved accounts",
          "newProfile": "New profile",
          "alreadyHaveAnAccount": "Do you already have an account? ",
          "signInHere": "Sign in here",
          "bySigningIn": "By signing in, you agree to our ",
          "termsOfService": "Terms of Service",
          "useProfileLocally": "Use this profile locally",
          "incorrectCredential": "Either email or password is wrong",
          "clickToChangeDate": "Click to change date",
          "notifications": "Notifications",
          "clients": "Clients"
        },
        'es': {
          'title': 'Gestor de Citas',
          'setup': 'Configuración',
          'home': 'Inicio',
          'login': 'Iniciar Sesión',
        },
      };

  static String get title => 'title';

  static String get setup => 'setup';

  static String get home => 'home';

  static String get login => 'login';

  static String get letsGetStarted => "Let's get started";

  static String get whatsYourName => "What's your name?";

  static String get name => "Name";

  static String get next => "Next";

  static String get continueWithoutImage => "Continue without image";

  static String get noThanks => "No, thanks";

  static String get chooseYouProfileImage => "Choose you profile image";

  static String get receiveEmailsOfNewFeatures =>
      "Receive emails of new features?";

  static String get pleaseEnterSomeText => "Please enter some text";

  static String get pleaseEnterAValidEmail => "Please enter a valid email";

  static String get email => "Email";

  static String get finish => "Finish";

  static String get welcome => "Welcome";

  static String get todaysTotalAppointments => "Today's total appointments";

  static String get save => "Save";

  static String get descriptionHint => "descriptionHint";

  static String get description => "description";

  static String get phone => "phone";

  static String get createClient => "create_client";

  static String get unSelectImage => "unSelectImage";

  static String get selectImage => "selectImage";

  static String get enterValidPhone => "enterValidPhone";

  static String get filters => "filters";

  static String get scheduleAppointment => "scheduleAppointment";

  static String get quickCall => "quickCall";

  static String get viewProfile => "viewProfile";

  static String get clientsNotFound=>"clientsNotFound";

  static String get addClient=>"addClient";

  static String get minutes => "minutes";

  static String get hourMinutes => "hourMinutes";

  static String get hour => "hour";

  static String get newAppointment => "newAppointment";

  static String get noClientsFound => "noClientsFound";

  static String get tapToAddClient => "tapToAddClient";

  static String get newClient => "newClient";

  static String get clientName => "clientName";

  static String get appointmentsDate => "appointmentsDate";

  static String get addANewField => "addANewField";

  static String get month => "month";

  static String get week => "week";

  static String get day => "day";

  static String get today => "today";

  static String get tomorrow => "tomorrow";

  static String get yesterday => "yesterday";

  static String get twoWeeks => "twoWeeks";

  static String get appointmentCreated => "appointmentCreated";

  static String get todayAppointments => "todayAppointments";

  static String get calendar => "calendar";

  static String get nameIsRequired=>"nameIsRequired";

  static String get nothingForToday=> "nothingForToday";

  static String get addNewField => "addNewField";

  static String get customFields => "customFields";

  static String get duration => "duration";

  static String get preview => "preview";

  static String get number => "number";

  static String get imageList => "imageList";

  static String get audio => "audio";

  static String get video => "video";

  static String get file => "file";

  static String get date => "date";

  static String get pleaseSelectAClient => "pleaseSelectAClient";

  static String get selectAppointment => "selectAppointment";

  static String get pleaseEnterATitle => "pleaseEnterATitle";

  static String get shortText => "shortText";

  static String get largeText => "largeText";

  static String get phoneNumber => "phoneNumber";

  static String get images => "images";

  static String get removeField => "removeField";

  static String get somethingWentWrong => "somethingWentWrong";

  static String get signUp => "signUp";

  static String get password => "password";

  static String get continueWithoutAccount => "continueWithoutAccount";

  static String get passwordTooShort => "passwordTooShort";

  static String get passwordNotMatch => "passwordNotMatch";

  static String get confirmPassword => "confirmPassword";

  static String get youCanCreateAccountLater => "youCanCreateAccountLater";

  static String get savedAccounts => "savedAccounts";

  static String get newProfile => "newProfile";

  static String get alreadyHaveAnAccount => "alreadyHaveAnAccount";

  static String get signInHere => "signInHere";

  static String get bySigningIn => "bySigningIn";

  static String get termsOfService => "termsOfService";

  static String get useProfileLocally => "useProfileLocally";

  static String get incorrectCredential=> "incorrectCredential";

  static String get clickToChangeDate => "clickToChangeDate";

  static String get notifications=>"notifications";

  static String get clients=>"clients";

}
