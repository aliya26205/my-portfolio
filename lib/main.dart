import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'drawer.dart';

void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aliya Banu Portfolio',

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF4E3),
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF4512C),
        ),
      ),

      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  // ================= COLORS =================

  static const Color orange = Color(0xFFF4512C);
  static const Color pink = Color(0xFFF47A91);
  static const Color cream = Color(0xFFFFF4E3);
  static const Color peach = Color(0xFFFFD9B8);
  static const Color dark = Color(0xFF3D2925);

  // ================= SECTION KEYS =================

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final educationKey = GlobalKey();
  final contactKey = GlobalKey();

  // ================= OPEN LINK =================

  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  // ================= SCROLL =================

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      
      drawer: PortfolioDrawer(
    onHome: () => scrollTo(homeKey),
    onAbout: () => scrollTo(aboutKey),
    onSkills: () => scrollTo(skillsKey),
    onProjects: () => scrollTo(projectsKey),
    onEducation: () => scrollTo(educationKey),
    onContact: () => scrollTo(contactKey),
  ),

      // ================= APP BAR =================

      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,

        title: const Text(
          'ALIYA BANU',
          style: TextStyle(
            color: orange,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),

        actions: [
          LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                children: [
                  navButton('HOME', homeKey),
                  navButton('ABOUT', aboutKey),
                  navButton('SKILLS', skillsKey),
                  navButton('PROJECTS', projectsKey),
                  navButton('EDUCATION', educationKey),
                  navButton('CONTACT', contactKey),

                  const SizedBox(width: 15),
                ],
              );
            },
          ),
        ],
      ),

      // ================= BODY =================

      body: SingleChildScrollView(
        child: Column(
          children: [

            // =========================================================
            // HOME
            // =========================================================

            Container(
              key: homeKey,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 7,
                vertical: 70,
              ),

              color: cream,

              child: LayoutBuilder(
                builder: (context, constraints) {

                  bool isMobile = constraints.maxWidth < 700;

                  if (isMobile) {
                    return Column(
                      children: [

                        homeText(),

                        const SizedBox(height: 40),

                        profileShape(
                          height: 300,
                          width: 230,
                        ),
                      ],
                    );
                  }

                  return Row(
                    children: [

                      Expanded(
                        child: homeText(),
                      ),

                      Expanded(
                        child: Center(
                          child: profileShape(
                            height: 420,
                            width: 320,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // =========================================================
            // ABOUT
            // =========================================================

            Container(
              key: aboutKey,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 65,
              ),

              color: peach,

              child: Column(
                children: [

                  sectionTitle('ABOUT ME'),

                  const SizedBox(height: 25),

                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 900,
                    ),

                    child: const Text(
                      'I am an MCA student with a strong interest in '
                      'software development, web development and mobile '
                      'application development. I enjoy learning new '
                      'technologies and building projects that solve '
                      'real-world problems.',
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        color: dark,
                        fontSize: 18,
                        height: 1.6,
                      ),
                    ),
                  ),

                  const SizedBox(height: 35),

                  Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    alignment: WrapAlignment.center,

                    children: [
                      infoBadge(
                        Icons.school,
                        'MCA Student',
                      ),

                      infoBadge(
                        Icons.code,
                        'Developer',
                      ),

                      infoBadge(
                        Icons.lightbulb,
                        'Problem Solver',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // =========================================================
            // SKILLS
            // =========================================================

            Container(
              key: skillsKey,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 65,
              ),

              color: cream,

              child: Column(
                children: [

                  sectionTitle('MY SKILLS'),

                  const SizedBox(height: 35),

                  Wrap(
                    spacing: 18,
                    runSpacing: 18,
                    alignment: WrapAlignment.center,

                    children: [

                      techCard('Java', 'JAVA'),
                      techCard('Python', 'PY'),
                      techCard('HTML', 'HTML'),
                      techCard('CSS', 'CSS'),
                      techCard('JavaScript', 'JS'),
                      techCard('React', 'RE'),
                      techCard('Node.js', 'N'),
                      techCard('MySQL', 'SQL'),
                      techCard('GitHub', 'GH'),
                      techCard('PHP', 'PHP'),
                    ],
                  ),
                ],
              ),
            ),

            // =========================================================
            // PROJECTS
            // =========================================================

            Container(
              key: projectsKey,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 65,
              ),

              color: orange,

              child: Column(
                children: [

                  const Text(
                    'SELECTED PROJECTS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 35),

                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,

                    children: [

                      projectCard(
                        'CampusNav',
                        'Indoor localization and navigation '
                        'using WiFi and geomagnetic fingerprints.',
                        'Android • Java • WiFi • Sensors',
                        null,
                      ),

                      projectCard(
                        'LeakGuard',
                        'Intelligent data leak prevention system '
                        'for modern workplaces.',
                        'React • Node.js • Supabase',
                        'https://github.com/aliya26205/LeakGuard',
                      ),

                      projectCard(
                        'PharmaStock Manager',
                        'Pharmacy stock management system '
                        'for managing medicines and inventory.',
                        'PHP • MySQL • HTML • CSS',
                        'https://github.com/aliya26205/Pharmastock',
                      ),

                      projectCard(
                        'CheckMyFood',
                        'Food information and analysis application '
                        'using food product data.',
                        'HTML • CSS • JavaScript • API',
                        'https://github.com/aliya26205/Checkmyfood',
                      ),

                      projectCard(
                        'EasyBin',
                        'Smart waste management project designed '
                        'to improve waste collection.',
                        'IoT • Web • Sensors',
                        'https://github.com/aliya26205/EasyBin-SmartWaste',
                      ),

                      projectCard(
                        'BloomCanvas',
                        'Interactive creative web application '
                        'with drag and drop functionality.',
                        'HTML • CSS • JavaScript',
                        'https://github.com/aliya26205/bloomcanvas',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // =========================================================
            // EDUCATION
            // =========================================================

            Container(
              key: educationKey,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 65,
              ),

              color: cream,

              child: Column(
                children: [

                  sectionTitle('EDUCATION'),

                  const SizedBox(height: 35),

                  educationCard(
                    'MCA',
                    'St Joseph Engineering College',
                    'Mangaluru',
                    'Currently pursuing',
                    Icons.computer,
                  ),

                  const SizedBox(height: 20),

                  educationCard(
                    'BCA',
                    'St Aloysius College',
                    'Mangaluru',
                    'CGPA: 9.27',
                    Icons.school,
                  ),
                ],
              ),
            ),

            // =========================================================
            // CONTACT
            // =========================================================

            Container(
              key: contactKey,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 65,
              ),

              color: pink,

              child: Column(
                children: [

                  const Text(
                    'LET\'S CONNECT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Find me online',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    alignment: WrapAlignment.center,

                    children: [

                      socialButton(
                        'GitHub',
                        Icons.code,
                        'https://github.com/aliya26205',
                      ),

                      socialButton(
                        'LinkedIn',
                        Icons.business,
                        'https://www.linkedin.com/in/aliya-banu26',
                      ),

                      socialButton(
                        'LeetCode',
                        Icons.code,
                        'https://leetcode.com/u/Aliya26/',
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),

                  const Text(
                    '© 2026 Aliya Banu | Flutter Portfolio',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
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

  // =========================================================
  // HOME TEXT
  // =========================================================

  Widget homeText() {
      return Padding(
  padding: const EdgeInsets.only(
    left: 60,
    right: 25,
    top: 25,
    bottom: 25,
  ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Text(
            'HELLO, I\'M',
            style: TextStyle(
              color: pink,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
  'ALIYA BANU',
  style: TextStyle(
    color: orange,
    fontSize: 55,
    fontWeight: FontWeight.bold,
  ),
),

          const SizedBox(height: 10),

          const Text(
            'MCA STUDENT\n& DEVELOPER',
            style: TextStyle(
              color: dark,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'I enjoy building creative and useful '
            'applications using modern technologies.',
            style: TextStyle(
              color: dark,
              fontSize: 17,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 30),

          ElevatedButton(
            onPressed: () {
              scrollTo(projectsKey);
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: orange,
              foregroundColor: Colors.white,

              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 18,
              ),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),

            child: const Text(
              'VIEW MY WORK  →',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // PROFILE SHAPE
  // =========================================================

  Widget profileShape({
    required double height,
    required double width,
  }) {
    return Container(
      height: height,
      width: width,

      decoration: BoxDecoration(
        color: pink,
        borderRadius: BorderRadius.circular(180),
      ),

      // child: const Center(
      //   child: Icon(
      //     Icons.person,
      //     size: 150,
      //     color: Colors.white,
      //   ),
      // ),
      child: ClipRRect(
  borderRadius: BorderRadius.circular(180),
  child: Image.asset(
    'assets/aliya.jpeg',
    height: height,
    width: width,
    fit: BoxFit.cover,
  ),
),
    );
  }

  // =========================================================
  // NAVIGATION BUTTON
  // =========================================================

  Widget navButton(String title, GlobalKey key) {
    return TextButton(
      onPressed: () {
        scrollTo(key);
      },

      child: Text(
        title,
        style: const TextStyle(
          color: dark,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // =========================================================
  // SECTION TITLE
  // =========================================================

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: orange,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // =========================================================
  // INFO BADGE
  // =========================================================

  Widget infoBadge(
    IconData icon,
    String text,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),

      decoration: BoxDecoration(
        color: cream,
        borderRadius: BorderRadius.circular(30),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [

          Icon(
            icon,
            color: orange,
          ),

          const SizedBox(width: 8),

          Text(
            text,
            style: const TextStyle(
              color: dark,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // TECHNOLOGY CARD
  // =========================================================

  Widget techCard(
    String name,
    String logoText,
  ) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        border: Border.all(
          color: pink,
          width: 2,
        ),
      ),

      child: Column(
        children: [

          Container(
            height: 45,
            width: 45,

            alignment: Alignment.center,

            decoration: const BoxDecoration(
              color: orange,
              shape: BoxShape.circle,
            ),

            child: Text(
              logoText,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            name,
            textAlign: TextAlign.center,

            style: const TextStyle(
              color: dark,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // PROJECT CARD
  // =========================================================

  Widget projectCard(
    String title,
    String description,
    String technologies,
    String? githubLink,
  ) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(25),

      decoration: BoxDecoration(
        color: cream,
        borderRadius: BorderRadius.circular(25),
      ),

      child: Column(
        children: [

          Container(
            height: 65,
            width: 65,

            decoration: BoxDecoration(
              color: pink,
              borderRadius: BorderRadius.circular(18),
            ),

            child: const Icon(
              Icons.folder,
              color: Colors.white,
              size: 35,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            title,
            textAlign: TextAlign.center,

            style: const TextStyle(
              color: orange,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            description,
            textAlign: TextAlign.center,

            style: const TextStyle(
              color: dark,
              fontSize: 15,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            technologies,
            textAlign: TextAlign.center,

            style: const TextStyle(
              color: pink,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 20),

          if (githubLink != null)
            OutlinedButton(
              onPressed: () {
                openLink(githubLink);
              },

              style: OutlinedButton.styleFrom(
                foregroundColor: orange,
                side: const BorderSide(
                  color: orange,
                ),
              ),

              child: const Text(
                'VIEW PROJECT →',
              ),
            ),
        ],
      ),
    );
  }

  // =========================================================
  // EDUCATION CARD
  // =========================================================

  Widget educationCard(
    String degree,
    String college,
    String location,
    String result,
    IconData icon,
  ) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 800,
      ),

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(25),

        decoration: BoxDecoration(
          color: peach,
          borderRadius: BorderRadius.circular(25),

          border: Border.all(
            color: pink,
            width: 2,
          ),
        ),

        child: Row(
          children: [

            Container(
              height: 65,
              width: 65,

              decoration: const BoxDecoration(
                color: orange,
                shape: BoxShape.circle,
              ),

              child: Icon(
                icon,
                color: Colors.white,
                size: 32,
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    degree,
                    style: const TextStyle(
                      color: orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    college,
                    style: const TextStyle(
                      color: dark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    location,
                    style: const TextStyle(
                      color: dark,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    result,
                    style: const TextStyle(
                      color: pink,
                      fontWeight: FontWeight.bold,
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

  // =========================================================
  // SOCIAL BUTTON
  // =========================================================

  Widget socialButton(
    String name,
    IconData icon,
    String url,
  ) {
    return ElevatedButton.icon(
      onPressed: () {
        openLink(url);
      },

      icon: Icon(icon),

      label: Text(name),

      style: ElevatedButton.styleFrom(
        backgroundColor: orange,
        foregroundColor: Colors.white,

        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}