import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart' show kIsWeb;

class MagazinePage extends StatefulWidget {
  const MagazinePage({Key? key}) : super(key: key);

  @override
  State<MagazinePage> createState() => _MagazinePageState();
}

class _MagazinePageState extends State<MagazinePage> {
  @override
  Widget build(BuildContext context) {
    int currentYear = DateTime.now().year;
    int currentMonth = DateTime.now().month;
    List<String> monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    Future<void> downloadPDF() async {
      const url = 'http://3.7.73.205/main.pdf';
      if (kIsWeb) {
        html.window.open(url, '_blank');
      } else {
        // For mobile platforms, you might want to use a plugin like url_launcher
        // or implement a custom solution to download and open the PDF
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('PDF download not implemented for this platform')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Magazine",
          style: GoogleFonts.inconsolata(fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          width: 700,
          height: 200,
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                "God's Love Magazine",
                style: GoogleFonts.inconsolata(fontSize: 28),
              ),
              Text(
                "దేవుని ప్రేమ మాసపత్రిక",
                style: GoogleFonts.inconsolata(fontSize: 20),
              ),
              Text(
                "${monthNames[currentMonth - 1]} $currentYear",
                style: GoogleFonts.inconsolata(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: downloadPDF,
                icon: const Icon(Icons.download_rounded),
                label: Text(
                  "Download Now",
                  style: GoogleFonts.inconsolata(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black54,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
