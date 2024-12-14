

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
  static String get receiveEmailsOfNewFeatures => "Receive emails of new features?";
  static String get pleaseEnterSomeText => "Please enter some text";
  static String get pleaseEnterAValidEmail => "Please enter a valid email";
  static String get email => "Email";
  static String get finish => "Finish";
  static String get welcome => "Welcome";
  static String get todaysTotalAppointments => "Today's total appointments";

}
