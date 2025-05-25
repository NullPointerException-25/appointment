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
          "clientsNotFound":
              "Your clients must be here, but at least we found a cat",
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
          "youCanCreateAccountLater":
              "Don't worry, You can create and link an account later",
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
          "clients": "Clients",
          "templates": "Templates",
          "templateName": "Template name",
          "exampleTemplateName": "Ex. New client template",
          "defaultDuration": "Default duration",
          "useDefaultDuration": "Use default duration",
          "templateCreated": "Template created",
          "shortMonday": "Mon",
          "shortTuesday": "Tue",
          "shortWednesday": "Wed",
          "shortThursday": "Thu",
          "shortFriday": "Fri",
          "shortSaturday": "Sat",
          "shortSunday": "Sun",
          "longMonday": "Monday",
          "longTuesday": "Tuesday",
          "longWednesday": "Wednesday",
          "longThursday": "Thursday",
          "longFriday": "Friday",
          "longSaturday": "Saturday",
          "longSunday": "Sunday",
          "customFieldsDescription":
              "Add custom fields to your appointment to add more information.",
          "customFieldTitle": "Give a name to your custom field",
          "CreateTemplateDialog": "Creating a template will help you fill the custom fields according to your needs",
          "yourTemplates": "Your templates",
        },
        'es': {
          'title': 'Gestor de Citas',
          'setup': 'Configuración',
          'home': 'Inicio',
          'login': 'Iniciar sesión',
          "Let's String get started": "Empecemos",
          "What's your name?": "¿Cuál es tu nombre?",
          "Name": "Nombre",
          "Next": "Siguiente",
          "Continue without image": "Continuar sin imagen",
          "No, thanks": "No, gracias",
          "Choose you profile image": "Elige tu imagen de perfil",
          "Receive emails of new features?":
              "¿Deseas recibir correos con nuevas funciones?",
          "Please enter some text": "Por favor, ingresa texto",
          'Please enter a valid email': 'Por favor, ingresa un correo válido',
          'Email': 'Correo electrónico',
          "Finish": "Finalizar",
          "Welcome": "Bienvenido de nuevo,",
          "Today's total appointments": "Total de citas para hoy",
          "name": "Nombre",
          "email": "Correo electrónico",
          "phone": "Teléfono",
          "description": "Descripción",
          "save": "Guardar",
          "create_client": "Crear cliente",
          "descriptionHint":
              "Escribe una descripción general del cliente o cualquier otra información que quieras guardar",
          "unSelectImage": "Deseleccionar imagen",
          "selectImage": "Seleccionar imagen",
          "enterValidPhone": "Por favor, ingresa un número de teléfono válido",
          "filters": "Filtros",
          "viewProfile": "Ver perfil",
          "quickCall": "Llamada rápida",
          "scheduleAppointment": "Agendar cita",
          "clientsNotFound":
              "Tus clientes deberían estar aquí, pero al menos encontramos un gato",
          "addClient": "Agregar cliente",
          "minutes": "@minutes minutos",
          "hourMinutes": "@hours horas y @minutes minutos",
          "hour": "@hours horas",
          "newAppointment": "Nueva cita",
          "noClientsFound": "No se encontraron clientes",
          "tapToAddClient": "Toca para agregar un cliente",
          "newClient": "Nuevo cliente",
          "clientName": "Nombre del cliente",
          "appointmentsDate": "Fecha de la cita",
          "addANewField": "Agregar un nuevo campo",
          "month": "Mes",
          "week": "Semana",
          "day": "Día",
          "today": "Hoy",
          "tomorrow": "Mañana",
          "yesterday": "Ayer",
          "twoWeeks": "Dos semanas",
          "appointmentCreated": "Cita creada",
          "today'sAppointments": "Citas de hoy",
          "calendar": "Calendario",
          "nameIsRequired": "El nombre no puede estar vacío",
          "nothingForToday": "No hay citas para hoy",
          "addNewField": "Agregar nuevo campo",
          "customFields": "Campos personalizados",
          "duration": "Duración",
          "preview": "Vista previa",
          "number": "Número",
          "imageList": "Lista de imágenes",
          "audio": "Audio",
          "video": "Video",
          "file": "Archivo",
          "date": "Fecha",
          "pleaseSelectAClient": "Por favor, selecciona un cliente",
          "selectAppointment": "Por favor, selecciona una cita",
          "pleaseEnterATitle": "Por favor, ingresa un título",
          "shortText": "Texto corto",
          "largeText": "Texto largo",
          "phoneNumber": "Número de teléfono",
          "images": "Imágenes",
          "removeField": "Eliminar campo",
          "somethingWentWrong": "Algo salió mal",
          "signUp": "Registrarse",
          "password": "Contraseña",
          "continueWithoutAccount": "Continuar sin cuenta",
          "passwordTooShort": "La contraseña debe tener al menos 8 caracteres",
          "passwordNotMatch": "Las contraseñas no coinciden",
          "confirmPassword": "Confirmar contraseña",
          "youCanCreateAccountLater":
              "No te preocupes, puedes crear y vincular una cuenta más tarde",
          "letsGetStarted": "Empecemos",
          "whatsYourName": "¿Cuál es tu nombre?",
          "savedAccounts": "Cuentas guardadas",
          "newProfile": "Nuevo perfil",
          "alreadyHaveAnAccount": "¿Ya tienes una cuenta?",
          "signInHere": "Inicia sesión aquí",
          "bySigningIn": "Al iniciar sesión, aceptas nuestros ",
          "termsOfService": "Términos de servicio",
          "useProfileLocally": "Usar este perfil localmente",
          "incorrectCredential": "El correo o la contraseña son incorrectos",
          "clickToChangeDate": "Haz clic para cambiar la fecha",
          "notifications": "Notificaciones",
          "clients": "Clientes",
          "templates": "Plantillas",
          "templateName": "Nombre de la plantilla",
          "exampleTemplateName": "Ej. Plantilla nuevo cliente",
          "defaultDuration": "Duración predeterminada",
          "useDefaultDuration": "Usar duración predeterminada",
          "templateCreated": "Plantilla creada",
          "shortMonday": "Lun",
          "shortTuesday": "Mar",
          "shortWednesday": "Mié",
          "shortThursday": "Jue",
          "shortFriday": "Vie",
          "shortSaturday": "Sáb",
          "shortSunday": "Dom",
          "longMonday": "Lunes",
          "longTuesday": "Martes",
          "longWednesday": "Miércoles",
          "longThursday": "Jueves",
          "longFriday": "Viernes",
          "longSaturday": "Sábado",
          "longSunday": "Domingo",
          "customFieldsDescription":
              "Agrega campos personalizados a tu cita para añadir más información.",
          "customFieldTitle": "Dale un nombre a tu campo personalizado",
          "CreateTemplateDialog": "Crear una plantilla te ayudará a rellear los campos personalizados según tus necesidades",
          "yourTemplates": "Tus plantillas",
        }
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

  static String get clientsNotFound => "clientsNotFound";

  static String get addClient => "addClient";

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

  static String get nameIsRequired => "nameIsRequired";

  static String get nothingForToday => "nothingForToday";

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

  static String get incorrectCredential => "incorrectCredential";

  static String get clickToChangeDate => "clickToChangeDate";

  static String get notifications => "notifications";

  static String get clients => "clients";

  static String get templates => "templates";

  static String get templateName => "templateName";

  static String get exampleTemplateName => "exampleTemplateName";

  static String get defaultDuration => "defaultDuration";

  static String get useDefaultDuration => "useDefaultDuration";

  static String get templateCreated => "templateCreated";

  static String get shortMonday => "shortMonday";

  static String get shortTuesday => "shortTuesday";

  static String get shortWednesday => "shortWednesday";

  static String get shortThursday => "shortThursday";

  static String get shortFriday => "shortFriday";

  static String get shortSaturday => "shortSaturday";

  static String get shortSunday => "shortSunday";

  static String get longMonday => "longMonday";

  static String get longTuesday => "longTuesday";

  static String get longWednesday => "longWednesday";

  static String get longThursday => "longThursday";

  static String get longFriday => "longFriday";

  static String get longSaturday => "longSaturday";

  static String get longSunday => "longSunday";

  static String get customFieldTitle => "customFieldTitle";

  static String get customFieldsDescription => "customFieldsDescription";
  static String get createTemplateDialog => "CreateTemplateDialog";
  static String get yourTemplates => "yourTemplates";
}
