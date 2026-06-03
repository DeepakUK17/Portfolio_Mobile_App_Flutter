import 'package:flutter/material.dart';

class ContactLink {
  const ContactLink({
    required this.label,
    required this.value,
    required this.url,
    required this.icon,
  });

  final String label;
  final String value;
  final String url;
  final IconData icon;
}
