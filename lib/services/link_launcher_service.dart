import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkLauncherService {
  const LinkLauncherService._();

  static Future<void> openUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    final didLaunch = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!context.mounted || didLaunch) {
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Could not open $url')));
  }
}
