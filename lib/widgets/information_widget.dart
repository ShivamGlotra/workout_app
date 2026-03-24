import 'package:flutter/material.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.black12,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.info, color: Colors.black87),
            ),
            SizedBox(height: 10),
            Text(
              'How Selection Works',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              "Select the muscle groups you want to target in today's session. Your workout will be automatically customized based on your choices to ensure optimal training intensity.",
              style: TextStyle(letterSpacing: 1, height: 1.3),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all(2),
                  shadowColor: WidgetStateProperty.all(Colors.black87),
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(221, 43, 43, 43),
                  ),
                  foregroundColor: WidgetStateProperty.all(Colors.white),

                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                label: Text(
                  'Got it, thanks!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
