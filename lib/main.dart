import 'package:flutter/material.dart';

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
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFFFF4E3),
      ),

      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  // Colors
  static const Color orange = Color(0xFFF4512C);
  static const Color pink = Color(0xFFF47A91);
  static const Color cream = Color(0xFFFFF4E3);
  static const Color peach = Color(0xFFFFD9B8);
  static const Color dark = Color(0xFF3D2925);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,

      // TOP BAR
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
          TextButton(
            onPressed: () {},
            child: const Text(
              'HOME',
              style: TextStyle(color: dark),
            ),
          ),

          TextButton(
            onPressed: () {},
            child: const Text(
              'ABOUT',
              style: TextStyle(color: dark),
            ),
          ),

          TextButton(
            onPressed: () {},
            child: const Text(
              'SKILLS',
              style: TextStyle(color: dark),
            ),
          ),

          TextButton(
            onPressed: () {},
            child: const Text(
              'PROJECTS',
              style: TextStyle(color: dark),
            ),
          ),

          const SizedBox(width: 15),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // ================= HOME =================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 70,
              ),

              decoration: const BoxDecoration(
                color: cream,
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  // LEFT SIDE
                  Expanded(
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

                        const Text(
                          'MCA STUDENT\n& DEVELOPER',
                          style: TextStyle(
                            color: dark,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'I enjoy building creative and useful '
                          'applications using modern technologies.',
                          style: TextStyle(
                            color: dark,
                            fontSize: 17,
                          ),
                        ),

                        const SizedBox(height: 30),

                        ElevatedButton(
                          onPressed: () {},
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
                  ),

                  // RIGHT SIDE
                  Expanded(
                    child: Container(
                      height: 400,
                      margin: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: pink,
                        borderRadius: BorderRadius.circular(200),
                      ),

                      child: const Center(
                        child: Icon(
                          Icons.person,
                          size: 180,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ================= ABOUT =================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(50),

              decoration: const BoxDecoration(
                color: peach,
              ),

              child: Column(
                children: [

                  const Text(
                    'ABOUT ME',
                    style: TextStyle(
                      color: orange,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'I am an MCA student with a strong interest in '
                    'software development, web development and mobile '
                    'application development. I enjoy learning new '
                    'technologies and creating projects that solve '
                    'real-world problems.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: dark,
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            // ================= SKILLS =================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(50),

              child: Column(
                children: [

                  const Text(
                    'MY SKILLS',
                    style: TextStyle(
                      color: orange,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,

                    children: [

                      skillCard('Java', Icons.code),
                      skillCard('Python', Icons.computer),
                      skillCard('Flutter', Icons.phone_android),
                      skillCard('HTML & CSS', Icons.web),
                      skillCard('JavaScript', Icons.javascript),
                      skillCard('MySQL', Icons.storage),
                      skillCard('GitHub', Icons.source),
                    ],
                  ),
                ],
              ),
            ),

            // ================= PROJECTS =================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(50),

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

                  const SizedBox(height: 30),

                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,

                    children: [

                      projectCard(
                        'CampusNav',
                        'Indoor localization and navigation '
                        'using WiFi and geomagnetic fingerprints.',
                      ),

                      projectCard(
                        'LeakGuard',
                        'Intelligent data leak prevention system '
                        'for modern workplaces.',
                      ),

                      projectCard(
                        'PharmaStock Manager',
                        'Pharmacy stock management system '
                        'using PHP and MySQL.',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ================= EDUCATION =================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(50),

              color: cream,

              child: Column(
                children: [

                  const Text(
                    'EDUCATION',
                    style: TextStyle(
                      color: orange,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'MCA\n'
                    'St Joseph Engineering College, Mangaluru\n\n'
                    'BCA – CGPA 9.27\n'
                    'St Aloysius College, Mangaluru',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: dark,
                      fontSize: 18,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            // ================= CONTACT =================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(50),

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

                  const SizedBox(height: 20),

                  const Text(
                    'Interested in technology, development and creative projects?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'CONTACT ME',
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'Email: your-email@example.com\n'
                    'GitHub: github.com/yourusername\n'
                    'LinkedIn: linkedin.com/in/yourusername',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            // FOOTER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: dark,

              child: const Text(
                '© 2026 Aliya Banu | Flutter Portfolio',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // SKILL CARD
  static Widget skillCard(String title, IconData icon) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: pink,
          width: 2,
        ),
      ),

      child: Column(
        children: [

          Icon(
            icon,
            color: orange,
            size: 35,
          ),

          const SizedBox(height: 10),

          Text(
            title,
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

  // PROJECT CARD
  static Widget projectCard(
    String title,
    String description,
  ) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(25),

      decoration: BoxDecoration(
        color: cream,
        borderRadius: BorderRadius.circular(25),
      ),

      child: Column(
        children: [

          const Icon(
            Icons.folder,
            color: orange,
            size: 55,
          ),

          const SizedBox(height: 15),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: orange,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: dark,
              fontSize: 15,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}