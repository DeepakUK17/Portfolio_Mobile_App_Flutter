import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../models/certificate.dart';
import '../widgets/responsive_page.dart';
import '../widgets/section_header.dart';

class CertificatesScreen extends StatelessWidget {
  const CertificatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final crossAxisCount = width >= 980
        ? 4
        : width >= 680
        ? 3
        : 2;

    return ResponsivePage(
      children: [
        const SectionHeader(
          title: 'Certificates',
          subtitle: 'Tap any certificate to preview it.',
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: PortfolioData.certificates.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.64,
          ),
          itemBuilder: (context, index) {
            final certificate = PortfolioData.certificates[index];
            return _CertificateCard(certificate: certificate);
          },
        ),
      ],
    );
  }
}

class _CertificateCard extends StatelessWidget {
  const _CertificateCard({required this.certificate});

  final Certificate certificate;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _showCertificate(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                certificate.imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    certificate.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    certificate.issuer,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(certificate.date),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCertificate(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          child: Scaffold(
            appBar: AppBar(
              title: Text(certificate.title),
              actions: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            body: InteractiveViewer(
              child: Center(child: Image.asset(certificate.imagePath)),
            ),
          ),
        );
      },
    );
  }
}
