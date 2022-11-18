import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:originner/colors.dart';
import 'package:originner/features/auth/controller/auth_controller.dart';
import 'package:originner/features/landing/screens/landing_screen.dart';
import 'package:originner/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:originner/features/chat/widgets/contacts_list.dart';

class MobileLayoutScreen extends ConsumerStatefulWidget {
  const MobileLayoutScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends ConsumerState<MobileLayoutScreen>
    with WidgetsBindingObserver {
  // ignore: prefer_final_fields
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(authControllerProvider).setUserState(true);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.paused:
        ref.read(authControllerProvider).setUserState(false);
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          centerTitle: false,
          title: const Text(
            'Originner app',
            style: TextStyle(
              fontSize: 22,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Ionicons.search, color: Colors.grey),
              onPressed: () {},
            ),
            IconButton(
                icon: const Icon(Iconsax.logout, color: Colors.grey),
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.pushNamed(context, LandingScreen.routeName);
                })
          ],
          bottom: const TabBar(
            indicatorColor: tabColor,
            indicatorWeight: 2,
            labelColor: tabColor,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(
                icon: Icon(Iconsax.message),
              ),
              Tab(
                icon: Icon(Ionicons.stats_chart_outline),
              ),
              Tab(
                icon: Icon(Iconsax.call),
              ),
            ],
          ),
        ),
        body: const ContactsList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, SelectContactsScreen.routeName);
          },
          backgroundColor: tabColor,
          child: const Icon(
            Iconsax.user_add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
