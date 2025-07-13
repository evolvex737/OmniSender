import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'components/main.components.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  static final destinations = {
    Icons.dashboard: "Dashboard",
    Icons.bar_chart_rounded: "Chart",
    Icons.people_alt_rounded: "Users",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 156,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset('assets/icons/evo3.png', scale: 4.5),
        ),
        actions: [
          PopupMenuButton(
            position: PopupMenuPosition.under,
            padding: EdgeInsetsGeometry.zero,
            icon: TextButton.icon(
              onPressed: null,
              style: TextButton.styleFrom(
                padding: EdgeInsets.only(left: 0, right: 10),
              ),
              icon: CircleAvatar(
                backgroundColor: context.theme.primaryColor,
                child: Icon(
                  Icons.person,
                  color: context.theme.scaffoldBackgroundColor,
                ),
              ),
              label: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      "Angga Andika Putra",
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Super Admin",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            itemBuilder: (context) =>
                {Icons.person: "Profil", Icons.logout: "Logout"}.entries
                    .map(
                      (e) => PopupMenuItem<int>(
                        value: e
                            .key
                            .codePoint, // pakai codePoint agar IconData bisa jadi int unik
                        child: Row(
                          children: [
                            Icon(
                              e.key,
                              size: 18,
                              color: context.theme.primaryColor,
                            ),
                            const SizedBox(width: 18),
                            Text(
                              e.value,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            const SizedBox(width: 38),
                          ],
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
      body: SafeArea(
        child: Row(
          children: [
            SideBarCustom(destinations: destinations),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  CustomHeaderTile(title: "title", subtitle: "subtitle"),
                  SizedBox(height: 15),
                  Expanded(
                    child: IndexedStack(
                      index: 0,
                      children: destinations.entries
                          .map(
                            (e) => Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    e.key,
                                    color: context.theme.primaryColor,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    e.value,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
