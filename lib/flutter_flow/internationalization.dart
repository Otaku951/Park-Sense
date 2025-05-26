import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hans'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HansText = '',
  }) =>
      [enText, zh_HansText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Profile
  {
    'teyyztpg': {
      'en': 'Personal Information',
      'zh_Hans': '',
    },
    'ikvldhsh': {
      'en': 'Mr.Ou',
      'zh_Hans': '',
    },
    '46six8nq': {
      'en': 'Email Address@gmail.com',
      'zh_Hans': '',
    },
    'bm4168ew': {
      'en': 'Parking History',
      'zh_Hans': '',
    },
    '3krggv3c': {
      'en': 'My bookings',
      'zh_Hans': '',
    },
    'myqjrg5d': {
      'en': 'Security & Privacy',
      'zh_Hans': '',
    },
    'ixto3m96': {
      'en': 'Log Out',
      'zh_Hans': '',
    },
    '9guo23y7': {
      'en': '__',
      'zh_Hans': '',
    },
  },
  // EditProfile
  {
    'cwcs8xz9': {
      'en': 'Create your Profile',
      'zh_Hans': '',
    },
    'oaedgepi': {
      'en': 'Username',
      'zh_Hans': '',
    },
    'x71qbljq': {
      'en': 'Display name',
      'zh_Hans': '',
    },
    '1qhgc17q': {
      'en': 'Email',
      'zh_Hans': '',
    },
    'alb08ekb': {
      'en': 'Password',
      'zh_Hans': '',
    },
    'ow8049oh': {
      'en': 'Number',
      'zh_Hans': '',
    },
    'mwvjg2s5': {
      'en': 'Cancel',
      'zh_Hans': '',
    },
    'ilshakwl': {
      'en': 'Apply',
      'zh_Hans': '',
    },
  },
  // History
  {
    'l788rk10': {
      'en': 'Parking History',
      'zh_Hans': '',
    },
    'g2fteuc1': {
      'en': 'Sort by:',
      'zh_Hans': '',
    },
    'bc1rjzw0': {
      'en': 'Select...',
      'zh_Hans': '',
    },
    'xackenkj': {
      'en': 'Search...',
      'zh_Hans': '',
    },
    'mybjm5s8': {
      'en': 'Place',
      'zh_Hans': '',
    },
    '2irb52qy': {
      'en': 'Location',
      'zh_Hans': '',
    },
    '0d0blo1v': {
      'en': 'Availability',
      'zh_Hans': '',
    },
    'z8t6avwu': {
      'en': 'More...',
      'zh_Hans': '',
    },
    'ril5tjo5': {
      'en': 'Mon. July 3rd',
      'zh_Hans': '',
    },
    'upaph011': {
      'en': 'PSB #: ',
      'zh_Hans': '',
    },
    'mx1zuaed': {
      'en': '143A',
      'zh_Hans': '',
    },
    'rsugwmzo': {
      'en': '5.6km',
      'zh_Hans': '',
    },
    'vj9zc5w2': {
      'en': 'Empty',
      'zh_Hans': '',
    },
    'ewh6cpp1': {
      'en': 'Details',
      'zh_Hans': '',
    },
    'xcglv18k': {
      'en': 'Wed. July 6rd',
      'zh_Hans': '',
    },
    '05ha0v6f': {
      'en': 'Bugis #: ',
      'zh_Hans': '',
    },
    'tsl6tv3j': {
      'en': '666A',
      'zh_Hans': '',
    },
    'o10nv6o8': {
      'en': '2km',
      'zh_Hans': '',
    },
    'lvx6wcga': {
      'en': 'Full',
      'zh_Hans': '',
    },
    '44t5017s': {
      'en': 'Details',
      'zh_Hans': '',
    },
    'j29wtri8': {
      'en': 'Mon. July 10rd',
      'zh_Hans': '',
    },
    'vwmyf7zl': {
      'en': 'PSB #: ',
      'zh_Hans': '',
    },
    'ggpsdnlx': {
      'en': '185A',
      'zh_Hans': '',
    },
    'nnxx8oqt': {
      'en': '3km',
      'zh_Hans': '',
    },
    '6t95ndc7': {
      'en': '5 Lots',
      'zh_Hans': '',
    },
    'kni4n1gz': {
      'en': 'Details',
      'zh_Hans': '',
    },
    'pllrtw8n': {
      'en': 'Mon. July 3rd',
      'zh_Hans': '',
    },
    'q2oc7k0e': {
      'en': 'PSB #: ',
      'zh_Hans': '',
    },
    '0xvauomv': {
      'en': '888A',
      'zh_Hans': '',
    },
    '2q44z27y': {
      'en': '5km',
      'zh_Hans': '',
    },
    'cy6864uc': {
      'en': '25 Lots',
      'zh_Hans': '',
    },
    'ncbatdru': {
      'en': 'Details',
      'zh_Hans': '',
    },
    '2wbutwxf': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // FAQsection
  {
    'zbcj0z7w': {
      'en': 'FAQ section',
      'zh_Hans': '',
    },
    'v6xlv7la': {
      'en': 'Welcome to FAQ section',
      'zh_Hans': '',
    },
    '6p1eqs5t': {
      'en': 'How can we help you?',
      'zh_Hans': '',
    },
    'dlg8ndgb': {
      'en': ' Search Queshion',
      'zh_Hans': '',
    },
    'eqwhv3uv': {
      'en': 'Review FAQ\'s below',
      'zh_Hans': '',
    },
    '2pq8sbjz': {
      'en':
          'Why I have been billed on days when                      \n I didn\'t drive?',
      'zh_Hans': '',
    },
    'rlfmkulb': {
      'en': 'What happens if I forget to end my parking          \nsession?',
      'zh_Hans': '',
    },
    'zu7hmxwb': {
      'en': 'I believe I was charged double / overcharged      ',
      'zh_Hans': '',
    },
    'v53ii24r': {
      'en': 'Feedback and Suggestions',
      'zh_Hans': '',
    },
    'bxg81dvg': {
      'en': 'Please enter your suggestions',
      'zh_Hans': '',
    },
    'i8uausx4': {
      'en':
          'The more complete the information you fill in, the more likely the problem will be solved~',
      'zh_Hans': '',
    },
    'k3l1okh5': {
      'en': 'Submit',
      'zh_Hans': '',
    },
    'baskka2x': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // Carpark
  {
    'oeb5tc4v': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // Homepage
  {
    'zfnlzgfa': {
      'en': 'Homepage',
      'zh_Hans': '',
    },
    'gvjx7xgi': {
      'en': 'xxxxxxx@valorant.com',
      'zh_Hans': '',
    },
    'ajcs2aoy': {
      'en': 'Mr. Ou',
      'zh_Hans': '',
    },
    'tett0kpk': {
      'en': 'My Accounnt',
      'zh_Hans': '',
    },
    'v4lor71i': {
      'en': 'Parking History',
      'zh_Hans': '',
    },
    'kv094v1w': {
      'en': 'FAQ Section',
      'zh_Hans': '',
    },
    'pqvgzo3w': {
      'en': 'Search for parking locations...',
      'zh_Hans': '',
    },
    '7smdb3pd': {
      'en': 'Nearby Car Parks',
      'zh_Hans': '',
    },
    '82oncinq': {
      'en': '1111',
      'zh_Hans': '',
    },
    'tiuicrxz': {
      'en': 'Total Lots',
      'zh_Hans': '',
    },
    'zjy3cm54': {
      'en': '156',
      'zh_Hans': '',
    },
    '4bnc760o': {
      'en': 'Available',
      'zh_Hans': '',
    },
    'y2ita7zc': {
      'en': '43',
      'zh_Hans': '',
    },
    'pwrpybw3': {
      'en': 'Type',
      'zh_Hans': '',
    },
    'z2ecxfeh': {
      'en': 'Covered',
      'zh_Hans': '',
    },
    'k1q5wq3e': {
      'en': '2222',
      'zh_Hans': '',
    },
    'v3duk18y': {
      'en': 'Total Lots',
      'zh_Hans': '',
    },
    '8o7qt4dx': {
      'en': '400',
      'zh_Hans': '',
    },
    'dmh57zyr': {
      'en': 'Available',
      'zh_Hans': '',
    },
    '8cnf2adb': {
      'en': '127',
      'zh_Hans': '',
    },
    'qu7rfn50': {
      'en': 'Type',
      'zh_Hans': '',
    },
    '7ruvctrt': {
      'en': 'Basement',
      'zh_Hans': '',
    },
    'ldl7l5ia': {
      'en': '3333',
      'zh_Hans': '',
    },
    'hmo4r3s8': {
      'en': 'Total Lots',
      'zh_Hans': '',
    },
    '59oqj6gh': {
      'en': '250',
      'zh_Hans': '',
    },
    '6ll9gqz8': {
      'en': 'Available',
      'zh_Hans': '',
    },
    'mj7gzq2a': {
      'en': '12',
      'zh_Hans': '',
    },
    'yv15r6nr': {
      'en': 'Type',
      'zh_Hans': '',
    },
    'e548k7l5': {
      'en': 'Covered',
      'zh_Hans': '',
    },
  },
  // RegisterPage
  {
    'sabkujwh': {
      'en': 'ParkSense',
      'zh_Hans': '',
    },
    '5v6e9kht': {
      'en': 'Create an account',
      'zh_Hans': '',
    },
    'm96cubko': {
      'en': 'Let\'s get started by filling out the form below.',
      'zh_Hans': '',
    },
    'xahnssln': {
      'en': 'Email',
      'zh_Hans': '',
    },
    '41kh37l8': {
      'en': 'Password',
      'zh_Hans': '',
    },
    'dtt6zg8r': {
      'en': 'Confirm Password',
      'zh_Hans': '',
    },
    'dsq1uwjc': {
      'en': 'Create Account',
      'zh_Hans': '',
    },
    '7nkm2gfb': {
      'en': 'Or sign up with',
      'zh_Hans': '',
    },
    '2fjmeh29': {
      'en': 'Continue with Google',
      'zh_Hans': '',
    },
    'hwvyledh': {
      'en': 'Continue as Guest',
      'zh_Hans': '',
    },
    'xskwu0ry': {
      'en': 'Already have an account? ',
      'zh_Hans': '',
    },
    'xffn2hqt': {
      'en': 'Sign In here',
      'zh_Hans': '',
    },
    'hszwzpwq': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // LoginPage
  {
    'a7u7o94e': {
      'en': 'ParkSense',
      'zh_Hans': '',
    },
    '0uk977lr': {
      'en': 'Get Started',
      'zh_Hans': '',
    },
    '3ul5jq2t': {
      'en': 'Let\'s get started by filling out the form below.',
      'zh_Hans': '',
    },
    'yt0b5ppa': {
      'en': 'Email',
      'zh_Hans': '',
    },
    '2tguu8co': {
      'en': 'Password',
      'zh_Hans': '',
    },
    '7xdqmp9w': {
      'en': 'Login',
      'zh_Hans': '',
    },
    's1jfcind': {
      'en': 'Or sign up with',
      'zh_Hans': '',
    },
    'pn0gptmo': {
      'en': 'Continue with Google',
      'zh_Hans': '',
    },
    '9vfgek3u': {
      'en': 'Continue as Guest',
      'zh_Hans': '',
    },
    '8tos7byc': {
      'en': 'Don\'t have an account?  ',
      'zh_Hans': '',
    },
    'ehfe9qlg': {
      'en': 'Sign Up here',
      'zh_Hans': '',
    },
    'y63graat': {
      'en': 'Forgot password? ',
      'zh_Hans': '',
    },
    'j7pkagli': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // ForgetPasswordPage
  {
    'jwi9maak': {
      'en': 'Back',
      'zh_Hans': '',
    },
    'bmyzehn0': {
      'en': 'Back',
      'zh_Hans': '',
    },
    'mmmsd896': {
      'en': 'Forgot Password',
      'zh_Hans': '',
    },
    'v6pt8w3j': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'zh_Hans': '',
    },
    'icb7wyon': {
      'en': 'Your email address...',
      'zh_Hans': '',
    },
    '372po031': {
      'en': 'Enter your email...',
      'zh_Hans': '',
    },
    '048nlg1q': {
      'en': 'Send Link',
      'zh_Hans': '',
    },
    '78ih1e1p': {
      'en': 'Home',
      'zh_Hans': '',
    },
  },
  // Miscellaneous
  {
    'dzzmon4p': {
      'en': '',
      'zh_Hans': '',
    },
    '51boof9v': {
      'en': '',
      'zh_Hans': '',
    },
    'h5l76oxe': {
      'en': 'The app needs to access your current location.',
      'zh_Hans': '',
    },
    'duluw93t': {
      'en':
          'To obtain your location, access to your geographical position is required.',
      'zh_Hans': '',
    },
    '9e0unt7e': {
      'en': '',
      'zh_Hans': '',
    },
    'e3f64ygn': {
      'en': '',
      'zh_Hans': '',
    },
    'u89meji0': {
      'en': '',
      'zh_Hans': '',
    },
    '3k0s6k7g': {
      'en': '',
      'zh_Hans': '',
    },
    '9nukhuon': {
      'en': '',
      'zh_Hans': '',
    },
    'ts7r24f9': {
      'en': '',
      'zh_Hans': '',
    },
    '290589zf': {
      'en': '',
      'zh_Hans': '',
    },
    'kbysiu6h': {
      'en': '',
      'zh_Hans': '',
    },
    '4v5k6a6e': {
      'en': '',
      'zh_Hans': '',
    },
    '9kkd30hx': {
      'en': '',
      'zh_Hans': '',
    },
    'oitlm6km': {
      'en': '',
      'zh_Hans': '',
    },
    '6rann81t': {
      'en': '',
      'zh_Hans': '',
    },
    '0ecmz9u0': {
      'en': '',
      'zh_Hans': '',
    },
    '9yz8dwxt': {
      'en': '',
      'zh_Hans': '',
    },
    'odu9w8c2': {
      'en': '',
      'zh_Hans': '',
    },
    'jx2kfsr3': {
      'en': '',
      'zh_Hans': '',
    },
    'njqsurz3': {
      'en': '',
      'zh_Hans': '',
    },
    '3arsjw71': {
      'en': '',
      'zh_Hans': '',
    },
    '77teyf97': {
      'en': '',
      'zh_Hans': '',
    },
    '694vuova': {
      'en': '',
      'zh_Hans': '',
    },
    'wmadzdso': {
      'en': '',
      'zh_Hans': '',
    },
    'dsteuba4': {
      'en': '',
      'zh_Hans': '',
    },
    'w8gy4c9o': {
      'en': '',
      'zh_Hans': '',
    },
    'qmkofws6': {
      'en': '',
      'zh_Hans': '',
    },
    'lomvjog0': {
      'en': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
