import 'package:flutter/material.dart';
import 'package:manlift_app/feature/Home/pages/homepage.dart';
import 'package:manlift_app/services/aws_ses_service.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({super.key, this.emailResult});

  final EmailDeliveryResult? emailResult;

  @override
  Widget build(BuildContext context) {
    final result = emailResult;
    final isSuccess = result?.isSuccess ?? true;
    final icon = isSuccess ? Icons.check_circle_outline : Icons.warning_amber_rounded;
    final iconColor = isSuccess ? Colors.green : Colors.orange;
    final message = result?.userMessage ??
        'Your inspection report has been created and saved in the internal storage.';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Report Status'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 80),
            const SizedBox(height: 20),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
