import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class State with ChangeNotifier {
  /// This app's version, according to `pubspec.yaml`.
  static final appVersion = () async {
    var appInfo = await PackageInfo.fromPlatform();
    return "${appInfo.version}";
  }();
  SupabaseClient get supabase => Supabase.instance.client;
}
