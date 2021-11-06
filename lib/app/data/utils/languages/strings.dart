import 'package:get/get.dart';

class Strings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
          'name_page_question': 'What\'s your name?',
          'name_page_why': 'So that we know how to call you.',
          'name_page_hintText': 'Your full name',
          'adr_page_question': 'What\'s your address?',
          'adr_page_why': 'So that we know where to deliever.',
          'adr_page_button_help':
              'Generate your address from your current location.',
          'adr_page_helper':
              'Generated address is worng? \nplease enter your address manually',
          'adr_page_button': 'Get my current location',
          'adr_page_hint': 'Address',
          'phone_page_question': 'Mobile Verification',
          'phone_page_why':
              'Please enter your phone number \nto verify your account.',
          'phone_page_hintText': 'Phone number',
          'otp_page_question': 'Verification code',
          'otp_page_why': 'Please type the verification code \nsent to ',
          'done_page_button': 'Done',
          'done_page_text': 'Your account has been verified successfully!'
        },
        'fr_FR': {
          'hello': 'bonjour',
          'name_page_question': 'Quelle est votre nom?',
          'name_page_why': 'Pour que nous sachions comment \nvous appeler.',
          'name_page_hintText': 'Votre nom complet',
          'adr_page_question': 'Quelle est ton adresse?',
          'adr_page_why': 'Pour que nous sachions où livrer.',
          'adr_page_button_help':
              'Générez votre adresse à partir de votre emplacement actuel.',
          'adr_page_helper':
              'L\'adresse générée est erronée ? \nveuillez entrer votre adresse manuellement',
          'adr_page_button': 'Obtenir ma position actuelle',
          'adr_page_hint': 'Adresse',
          'phone_page_question': 'Vérification mobile',
          'phone_page_why':
              'Veuillez entrer votre numéro de téléphone \npour vérifier votre compte.',
          'phone_page_hintText': 'Numéro de téléphone',
          'otp_page_question': 'Code de vérification',
          'otp_page_why': 'Veuillez saisir le code de vérification \nenvoyé à ',
          'done_page_button': 'Terminé',
          'done_page_text': 'Votre compte a été vérifié avec succès !'
        },
      };
}
