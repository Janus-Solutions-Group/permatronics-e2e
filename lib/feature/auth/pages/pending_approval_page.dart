import 'package:flutter/material.dart';
import 'package:manlift_app/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class PendingApprovalPage extends StatefulWidget {
  const PendingApprovalPage({super.key});

  @override
  State<PendingApprovalPage> createState() => _PendingApprovalPageState();
}

class _PendingApprovalPageState extends State<PendingApprovalPage> {
  bool _isChecking = false;

  Future<void> _checkAgain() async {
    setState(() => _isChecking = true);
    await context.read<AuthProvider>().refreshProfile();
    if (mounted) setState(() => _isChecking = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Pending Approval'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.hourglass_top, size: 80, color: Colors.orange),
            const SizedBox(height: 20),
            const Text(
              'Your account is awaiting admin approval. You will be able to '
              'sign in once an administrator activates your account.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _isChecking ? null : _checkAgain,
              child: _isChecking
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white),
                    )
                  : const Text('Check Again'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => context.read<AuthProvider>().signOut(),
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
