import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioDrawer extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onEducation;
  final VoidCallback onContact;

  const PortfolioDrawer({
    super.key,
    required this.onHome,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onEducation,
    required this.onContact,
  });

  // Open social links
  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          // ================= DRAWER HEADER =================

          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFFF4512C),
            ),

            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Icon(
                  Icons.account_circle,
                  size: 60,
                  color: Colors.white,
                ),

                SizedBox(height: 8),

                Text(
                  'ALIYA BANU',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  'MCA Student & Developer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // ================= NAVIGATION =================

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              onHome();
            },
          ),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('About Me'),
            onTap: () {
              Navigator.pop(context);
              onAbout();
            },
          ),

          ListTile(
            leading: const Icon(Icons.code),
            title: const Text('Skills'),
            onTap: () {
              Navigator.pop(context);
              onSkills();
            },
          ),

          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text('Projects'),
            onTap: () {
              Navigator.pop(context);
              onProjects();
            },
          ),

          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Education'),
            onTap: () {
              Navigator.pop(context);
              onEducation();
            },
          ),

          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Contact'),
            onTap: () {
              Navigator.pop(context);
              onContact();
            },
          ),

          const Divider(),

          // ================= SOCIAL LINKS =================

          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),

            child: Text(
              'SOCIAL LINKS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.code),
            title: const Text('GitHub'),
            onTap: () {
              Navigator.pop(context);

              openLink(
                'https://github.com/aliya26205',
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.business),
            title: const Text('LinkedIn'),
            onTap: () {
              Navigator.pop(context);

              openLink(
                'https://www.linkedin.com/in/aliya-banu26',
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.emoji_objects),
            title: const Text('LeetCode'),
            onTap: () {
              Navigator.pop(context);

              openLink(
                'https://leetcode.com/u/Aliya26/',
              );
            },
          ),
        ],
      ),
    );
  }
}