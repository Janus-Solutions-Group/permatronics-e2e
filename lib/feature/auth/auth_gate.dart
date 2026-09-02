import 'package:flutter/material.dart';
import 'package:manlift_app/feature/Home/pages/homepage.dart';
import 'package:manlift_app/feature/admin/pages/admin_home_page.dart';
import 'package:manlift_app/feature/auth/pages/login_page.dart';
import 'package:manlift_app/feature/auth/pages/pending_approval_page.dart';
import 'package:manlift_app/provider/auth_provider.dart';
import 'package:provider/provider.dart';

/// Root widget swapped in as `MaterialApp.home`. Purely reactive — no
/// `Navigator` involved here, consistent with the rest of the app's
/// `moveTo`/`moveBack` push/pop navigation convention used within each branch.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    switch (auth.status) {
      case AuthStatus.unauthenticated:
        return const LoginPage();
      case AuthStatus.loadingProfile:
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      case AuthStatus.pendingApproval:
        return const PendingApprovalPage();
      case AuthStatus.authenticated:
        return auth.isAdmin ? const AdminHomePage() : const HomePage();
    }
  }
}
