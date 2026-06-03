import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../services/link_launcher_service.dart';
import '../widgets/responsive_page.dart';
import '../widgets/section_header.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 820;

    return ResponsivePage(
      children: [
        const SectionHeader(
          title: 'Contact',
          subtitle: 'Use the form for practice, or open a direct contact link.',
        ),
        if (isWide)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: _ContactLinks()),
              const SizedBox(width: 16),
              Expanded(child: _contactForm(formKey: _formKey)),
            ],
          )
        else ...[
          const _ContactLinks(),
          const SizedBox(height: 16),
          _contactForm(formKey: _formKey),
        ],
      ],
    );
  }

  Widget _contactForm({required GlobalKey<FormState> formKey}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Enter name' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter email';
                  }
                  if (!value.contains('@')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _messageController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  alignLabelWithHint: true,
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Enter message'
                    : null,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _submitForm,
                  icon: const Icon(Icons.send_outlined),
                  label: const Text('Send Message'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Message form validated. Backend can be connected later.',
        ),
      ),
    );

    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
  }
}

class _ContactLinks extends StatelessWidget {
  const _ContactLinks();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Find Me',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            for (final link in PortfolioData.contactLinks)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(link.icon),
                title: Text(link.label),
                subtitle: Text(link.value),
                trailing: const Icon(Icons.open_in_new),
                onTap: () => LinkLauncherService.openUrl(context, link.url),
              ),
          ],
        ),
      ),
    );
  }
}
