import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
class ShowPdf extends StatefulWidget {
  final String pdf;
  final FitPolicy fitPolicy;

  const ShowPdf({
    super.key,
    required this.fitPolicy,
    required this.pdf,
  });

  @override
  State<ShowPdf> createState() => _ShowPdfState();
}

class _ShowPdfState extends State<ShowPdf> {
  @override
  Widget build(BuildContext context) {
    return PDF(
      fitPolicy: widget.fitPolicy,
      enableSwipe: true,
      swipeHorizontal: true,
      autoSpacing: false,
      pageFling: false,
      onError: (error) {
      },
      onPageError: (page, error) {
      },
    ).cachedFromUrl(widget.pdf);
  }
}