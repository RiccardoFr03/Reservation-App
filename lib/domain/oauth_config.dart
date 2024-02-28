import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OauthConfig {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static String get redirectUri {
    if (kIsWeb) {
      return "http://localhost:30000/";
    } else {
      return "https://login.live.com/oauth20_desktop.srf";
    }
  }

  static final Config config = Config(
    tenant: "",
    clientId: "",
    scope: "User.Read email offline_access openid profile User.ReadBasic.All",
    navigatorKey: navigatorKey,
    redirectUri: redirectUri,
    webUseRedirect: false,
    loader: const Center(child: CircularProgressIndicator()),
  );

  static final AadOAuth aadOAuth = AadOAuth(config);
}
