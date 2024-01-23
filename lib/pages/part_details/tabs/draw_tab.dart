import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:pmprod/extensions/string_extension.dart';
import 'package:pmprod/widgets/show_pdf.dart';

class DrawTab extends StatefulWidget {
  final String? draw;

  const DrawTab({
    super.key,
    required this.draw,
  });

  @override
  State<DrawTab> createState() => _DrawTabState();
}

class _DrawTabState extends State<DrawTab> {
  @override
  Widget build(BuildContext context) {
    if (widget.draw == null) return const Center(child: Text('No drawing available'));
    return ShowPdf(
      fitPolicy: FitPolicy.BOTH,
      pdf: widget.draw.orEmpty(),
    );
  }
}
