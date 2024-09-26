import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
      final url = Uri.parse('http://3.7.73.205/main.pdf');
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        // Handle error: show a snackbar or dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $url')),
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
