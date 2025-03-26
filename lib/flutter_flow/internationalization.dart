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
  // Login
  {
    'bqg5yr6p': {
      'en': 'ParkSense',
      'zh_Hans': 'ParkSense',
    },
    'c7qc7dmg': {
      'en': 'Log in',
      'zh_Hans': '登录',
    },
    'auxj8g9e': {
      'en': 'Fill out the information below in order to access your account.',
      'zh_Hans': '填写以下信息以访问您的帐户。',
    },
    'sbqwl8rn': {
      'en': 'Email',
      'zh_Hans': '电子邮件',
    },
    'hb5y0qlo': {
      'en': 'Password',
      'zh_Hans': '密码',
    },
    'ed144x3d': {
      'en': 'Sign In',
      'zh_Hans': '登入',
    },
    'j3pvbp3q': {
      'en': 'Remember me for one week',
      'zh_Hans': '记住我一周',
    },
    'h3cjay68': {
      'en': 'or sign in with',
      'zh_Hans': '或使用以下方式登录',
    },
    '6x5273su': {
      'en': 'Continue with Facebook',
      'zh_Hans': '继续使用 Facebook',
    },
    'ptsgaogy': {
      'en': 'Continue with Google',
      'zh_Hans': '继续使用 Google',
    },
    'dyh5e5j5': {
      'en': 'Don\'t have an account? \nForgot the password？\n            ',
      'zh_Hans': '沒有帳戶？ \n忘记密碼？',
    },
    'egn8u7sx': {
      'en': ' Sign Up here',
      'zh_Hans': '在此注册',
    },
    's13wupw9': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // Profile
  {
    'ikvldhsh': {
      'en': 'Mr.Ou',
      'zh_Hans': '欧先生',
    },
    '46six8nq': {
      'en': 'Email Address@gmail.com',
      'zh_Hans': '电子邮件地址@gmail.com',
    },
    'bm4168ew': {
      'en': 'Parking History',
      'zh_Hans': '停车历史记录',
    },
    '3krggv3c': {
      'en': 'My bookings',
      'zh_Hans': '我的预订',
    },
    'ocb0fbb9': {
      'en': 'Change langugage',
      'zh_Hans': '更改语言',
    },
    'myqjrg5d': {
      'en': 'Security & Privacy',
      'zh_Hans': '安全和隐私',
    },
    'ixto3m96': {
      'en': 'Log Out',
      'zh_Hans': '登出',
    },
    'teyyztpg': {
      'en': 'Personal Information',
      'zh_Hans': '个人信息',
    },
    '9guo23y7': {
      'en': '__',
      'zh_Hans': '__',
    },
  },
  // creataProfile
  {
    'oaedgepi': {
      'en': 'Username',
      'zh_Hans': '用户名',
    },
    'x71qbljq': {
      'en': 'Display name',
      'zh_Hans': '显示名称',
    },
    '1qhgc17q': {
      'en': 'Email',
      'zh_Hans': '电子邮件',
    },
    'alb08ekb': {
      'en': 'Password',
      'zh_Hans': '密码',
    },
    'ow8049oh': {
      'en': 'Number',
      'zh_Hans': '数字',
    },
    'mwvjg2s5': {
      'en': 'Cancel',
      'zh_Hans': '取消',
    },
    'ilshakwl': {
      'en': 'Apply',
      'zh_Hans': '申请',
    },
    'cwcs8xz9': {
      'en': 'Create your Profile',
      'zh_Hans': '创建您的个人资料',
    },
  },
  // History
  {
    'g2fteuc1': {
      'en': 'Sort by:',
      'zh_Hans': '排序方式：',
    },
    'bc1rjzw0': {
      'en': 'Select...',
      'zh_Hans': '选择...',
    },
    'xackenkj': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    'mybjm5s8': {
      'en': 'Place',
      'zh_Hans': '地方',
    },
    '2irb52qy': {
      'en': 'Location',
      'zh_Hans': '地点',
    },
    '0d0blo1v': {
      'en': 'Availability',
      'zh_Hans': '可用性',
    },
    'z8t6avwu': {
      'en': 'More...',
      'zh_Hans': '更多的...',
    },
    'ril5tjo5': {
      'en': 'Mon. July 3rd',
      'zh_Hans': '7 月 3 日星期一',
    },
    'upaph011': {
      'en': 'PSB #: ',
      'zh_Hans': '公共服务号码：',
    },
    'mx1zuaed': {
      'en': '143A',
      'zh_Hans': '143A',
    },
    'rsugwmzo': {
      'en': '5.6km',
      'zh_Hans': '5.6公里',
    },
    'vj9zc5w2': {
      'en': 'Empty',
      'zh_Hans': '空的',
    },
    'ewh6cpp1': {
      'en': 'Details',
      'zh_Hans': '细节',
    },
    'xcglv18k': {
      'en': 'Wed. July 6rd',
      'zh_Hans': '7 月 6 日星期三',
    },
    '05ha0v6f': {
      'en': 'Bugis #: ',
      'zh_Hans': '武吉士人 #:',
    },
    'tsl6tv3j': {
      'en': '666A',
      'zh_Hans': '666A',
    },
    'o10nv6o8': {
      'en': '2km',
      'zh_Hans': '2公里',
    },
    'lvx6wcga': {
      'en': 'Full',
      'zh_Hans': '满的',
    },
    '44t5017s': {
      'en': 'Details',
      'zh_Hans': '细节',
    },
    'j29wtri8': {
      'en': 'Mon. July 10rd',
      'zh_Hans': '7 月 10 日星期一',
    },
    'vwmyf7zl': {
      'en': 'PSB #: ',
      'zh_Hans': '公共服务号码：',
    },
    'ggpsdnlx': {
      'en': '185A',
      'zh_Hans': '185A',
    },
    'nnxx8oqt': {
      'en': '3km',
      'zh_Hans': '3公里',
    },
    '6t95ndc7': {
      'en': '5 Lots',
      'zh_Hans': '5 批',
    },
    'kni4n1gz': {
      'en': 'Details',
      'zh_Hans': '细节',
    },
    'pllrtw8n': {
      'en': 'Mon. July 3rd',
      'zh_Hans': '7 月 3 日星期一',
    },
    'q2oc7k0e': {
      'en': 'PSB #: ',
      'zh_Hans': '公共服务号码：',
    },
    '0xvauomv': {
      'en': '888A',
      'zh_Hans': '888A',
    },
    '2q44z27y': {
      'en': '5km',
      'zh_Hans': '5公里',
    },
    'cy6864uc': {
      'en': '25 Lots',
      'zh_Hans': '25 批',
    },
    'ncbatdru': {
      'en': 'Details',
      'zh_Hans': '细节',
    },
    'l788rk10': {
      'en': 'Parking History',
      'zh_Hans': '停车历史记录',
    },
    '2wbutwxf': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // CreateAccount
  {
    'dy8s0ed7': {
      'en': 'Create an account',
      'zh_Hans': '创建一个帐户',
    },
    'p0xhpe0g': {
      'en': 'Let\'s get started by filling out the form below.',
      'zh_Hans': '让我们从填写下面的表格开始。',
    },
    'c2xo3uy0': {
      'en': 'Email',
      'zh_Hans': '电子邮件',
    },
    'dt4ik8ay': {
      'en': 'Password',
      'zh_Hans': '密码',
    },
    'houk0jrz': {
      'en': 'Confirm Password',
      'zh_Hans': '确认密码',
    },
    '4ggiaz68': {
      'en': 'Create',
      'zh_Hans': '创造',
    },
    'e20wo2ms': {
      'en': '——OR OTHER WAY TO CREATE——',
      'zh_Hans': '——或者其他创作方式——',
    },
    '3zxvyr59': {
      'en': 'Continue with Google',
      'zh_Hans': '继续使用 Google',
    },
    'ks995pf3': {
      'en': 'Continue with Facebook',
      'zh_Hans': '继续使用 Facebook',
    },
    '3ctwyr6o': {
      'en': 'Create Account',
      'zh_Hans': '创建账户',
    },
    '7rnqammf': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // FAQsection
  {
    'v6xlv7la': {
      'en': 'Welcome to FAQ section',
      'zh_Hans': '欢迎来到常见问题解答部分',
    },
    '6p1eqs5t': {
      'en': 'How can we help you?',
      'zh_Hans': '我们能为您做什么？',
    },
    'dlg8ndgb': {
      'en': ' Search Queshion',
      'zh_Hans': '搜索问题',
    },
    'eqwhv3uv': {
      'en': 'Review FAQ\'s below',
      'zh_Hans': '查看以下常见问题解答',
    },
    '2pq8sbjz': {
      'en':
          'Why I have been billed on days when                      \n I didn\'t drive?',
      'zh_Hans': '为什么我在没有开车的日子也收到了账单？',
    },
    'rlfmkulb': {
      'en': 'What happens if I forget to end my parking          \nsession?',
      'zh_Hans': '如果我忘记结束停车会发生什么？',
    },
    'zu7hmxwb': {
      'en': 'I believe I was charged double / overcharged      ',
      'zh_Hans': '我觉得我被多收了钱',
    },
    'v53ii24r': {
      'en': 'Feedback and Suggestions',
      'zh_Hans': '反馈和建议',
    },
    'bxg81dvg': {
      'en': 'Please enter your suggestions',
      'zh_Hans': '请输入您的建议',
    },
    'i8uausx4': {
      'en':
          'The more complete the information you fill in, the more likely the problem will be solved~',
      'zh_Hans': '填写的信息越完整，问题越有可能得到解决~',
    },
    'k3l1okh5': {
      'en': 'Submit',
      'zh_Hans': '提交',
    },
    'zbcj0z7w': {
      'en': 'FAQ section',
      'zh_Hans': '常见问题解答部分',
    },
    'baskka2x': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // Carpark
  {
    'oeb5tc4v': {
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // Homepage
  {
    'pqvgzo3w': {
      'en': 'Search for parking locations...',
      'zh_Hans': '搜索停车位置...',
    },
    '7smdb3pd': {
      'en': 'Nearby Car Parks',
      'zh_Hans': '附近的停车场',
    },
    '82oncinq': {
      'en': '1111',
      'zh_Hans': '1111',
    },
    'tiuicrxz': {
      'en': 'Total Lots',
      'zh_Hans': '总手数',
    },
    'zjy3cm54': {
      'en': '156',
      'zh_Hans': '156',
    },
    '4bnc760o': {
      'en': 'Available',
      'zh_Hans': '可用的',
    },
    'y2ita7zc': {
      'en': '43',
      'zh_Hans': '43',
    },
    'pwrpybw3': {
      'en': 'Type',
      'zh_Hans': '类型',
    },
    'z2ecxfeh': {
      'en': 'Covered',
      'zh_Hans': '覆盖',
    },
    'k1q5wq3e': {
      'en': '2222',
      'zh_Hans': '2222',
    },
    'v3duk18y': {
      'en': 'Total Lots',
      'zh_Hans': '总手数',
    },
    '8o7qt4dx': {
      'en': '400',
      'zh_Hans': '400',
    },
    'dmh57zyr': {
      'en': 'Available',
      'zh_Hans': '可用的',
    },
    '8cnf2adb': {
      'en': '127',
      'zh_Hans': '127',
    },
    'qu7rfn50': {
      'en': 'Type',
      'zh_Hans': '类型',
    },
    '7ruvctrt': {
      'en': 'Basement',
      'zh_Hans': '地下室',
    },
    'ldl7l5ia': {
      'en': '3333',
      'zh_Hans': '3333',
    },
    'hmo4r3s8': {
      'en': 'Total Lots',
      'zh_Hans': '总手数',
    },
    '59oqj6gh': {
      'en': '250',
      'zh_Hans': '250',
    },
    '6ll9gqz8': {
      'en': 'Available',
      'zh_Hans': '可用的',
    },
    'mj7gzq2a': {
      'en': '12',
      'zh_Hans': '12',
    },
    'yv15r6nr': {
      'en': 'Type',
      'zh_Hans': '类型',
    },
    'e548k7l5': {
      'en': 'Covered',
      'zh_Hans': '覆盖',
    },
    'zfnlzgfa': {
      'en': 'Homepage',
      'zh_Hans': '主页',
    },
    'gvjx7xgi': {
      'en': 'xxxxxxx@valorant.com',
      'zh_Hans': 'xxxxxxx@valorant.com',
    },
    'ajcs2aoy': {
      'en': 'Mr. Ou',
      'zh_Hans': '欧先生',
    },
    'tett0kpk': {
      'en': 'My Accounnt',
      'zh_Hans': '我的帳戶',
    },
    'v4lor71i': {
      'en': 'Parking History',
      'zh_Hans': '停车历史记录',
    },
    'kv094v1w': {
      'en': 'FAQ Section',
      'zh_Hans': '常见问题解答部分',
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
