import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:project5/features/home/pages/settings_page.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';

class Settings extends StatefulWidget {
  final String fnjskfkjdsf;
  final String bdfshjfdjshf;
  final String ndsajkfnsdkjfnkds;

  const Settings(
      {super.key,
      required this.fnjskfkjdsf,
      required this.bdfshjfdjshf,
      required this.ndsajkfnsdkjfnkds});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late AppsflyerSdk _appsflyerSdk;
  String adId = '';
  String paramsFirst = '';
  String paramsSecond = '';
  Map _deepLinkData = {};
  Map _gcd = {};
  bool _isFirstLaunch = false;
  String _afStatus = '';
  String _campaign = '';
  String _campaignId = '';
  String mxasd = '';
  String stats = '';

  @override
  void initState() {
    super.initState();
    initializeAppsflyerAndTracking();
  }

  Future<void> initializeAppsflyerAndTracking() async {
    await getTracking();
    await fetchData();
    await afStart();
  }

  Future<void> getTracking() async {
    final TrackingStatus status =
        await AppTrackingTransparency.requestTrackingAuthorization();
    stats = status.name;
    print(status);
  }

  Future<void> fetchData() async {
    adId = await AppTrackingTransparency.getAdvertisingIdentifier();
  }

  Future<void> afStart() async {
    final AppsFlyerOptions options = AppsFlyerOptions(
      showDebug: false,
      afDevKey: 'xmcqmbVvE5e4e2UBZ3twRT',
      appId: '6503623211',
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
      setState(() {
        _deepLinkData = res;
        paramsSecond = res['payload']
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
    });

    _appsflyerSdk.onInstallConversionData((res) {
      print(res);
      setState(() {
        _gcd = res;
        _isFirstLaunch = res['payload']['is_first_launch'];
        _afStatus = res['payload']['af_status'];
        paramsFirst = '&is_first_launch=$_isFirstLaunch&af_status=$_afStatus';
        _campaign = res['campaign'] ?? '';
        _campaignId = res['campaign_id'] ?? '';
      });
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
      setState(() {
        _deepLinkData = dp.toJson();
      });
    });

    apsID = await _appsflyerSdk.getAppsFlyerUID() ?? '';

    setState(() {});
    print('AppsFlyer ID: $apsID');

    _appsflyerSdk.startSDK(
      onSuccess: () {
        print("AppsFlyer SDK initialized successfully.");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String fdsfdsfdsf =
        '${widget.fnjskfkjdsf}${widget.bdfshjfdjshf}&appsflyer_id=$apsID&campaign=$_campaign&campaignId=$_campaignId';
    print(fdsfdsfdsf);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(fdsfdsfdsf),
          ),
        ),
      ),
    );
  }
}

class ExpenseData extends StatelessWidget {
  const ExpenseData({
    super.key,
    required this.expence,
    required this.number,
  });

  final bool expence;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          expence ? 'Expense' : 'Income',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          height: 18,
          width: 54,
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '$number$userCurrency',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
