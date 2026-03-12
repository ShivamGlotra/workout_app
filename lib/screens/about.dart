import "package:flutter/material.dart";

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutMeState();
}

class _AboutMeState extends State<About> {
  @override
  Widget build(BuildContext context) {
    late List<Map<String, dynamic>> connectWithMeButtons = [
      {"icon": Icons.email, "label": "Email"},
      {"icon": Icons.link, "label": "LinkedIn"},
      {"icon": Icons.share, "label": "GitHub"},
      {"icon": Icons.comment, "label": "Support"},
    ];
    late List<Map<String, dynamic>> faqData = [
      {
        "question": "Is it for beginners?",
        "answer":
            "Absolutely! This app is designed to be user-friendly for everyone, whether you're just starting out or have been lifting for years.",
      },
      {
        "question": "Can I track my progress?",
        "answer":
            "Yes! You can log your workouts, track your PRs, and see your progress over time.",
      },
      {
        "question": "Is it free?",
        "answer":
            "Yes, the app is completely free to use with optional in-app purchases for additional features.",
      },
      {
        "question": "How can I provide feedback?",
        "answer":
            "You can use the 'Support' button in the contact section to send us your feedback and suggestions.",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("About The App"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Colors.grey[300]),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 360),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                          image: DecorationImage(
                            image: AssetImage('assets/images/about_2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Shivam Glotra",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "CS Student & Flutter and Web Developer",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.grey[500],
                        ),
                      ),
                      Chip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.school,
                              size: 14,
                              color: Colors.blue[700],
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Build with passion and dumbells",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: const Color.fromARGB(255, 5, 115, 241),
                              ),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.lightBlue[50],
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 3,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.blue[50]!, width: 1),
                        ),
                      ),
                      SizedBox(height: 20),
                      descriptionBox(
                        Icon(Icons.menu_book, color: Colors.blue, size: 22),
                        "The Journey",
                        "I started building this app between lectures and late-night study sessions. What began as a personal tool to track my own PRs grew into a mission to simplify fitness for everyone. Balancing algorithms with deadlifts hasn't been easy, but it's been the most rewarding project of my degree. Every line of code was written with the goal of making your gym experience smoother.",
                      ),
                      SizedBox(height: 20),
                      descriptionBox(
                        Icon(Icons.psychology, color: Colors.blue, size: 22),
                        "My Mission",
                        "Fitness should be about progress, not perfection. My mission with this app is to empower you to track your gains, set new goals, and stay motivated on your fitness journey. Whether you're a beginner or a seasoned lifter, I want this app to be your trusted companion in the gym, helping you push past plateaus and celebrate every victory along the way.",
                      ),
                      SizedBox(height: 40),
                      Row(
                        children: [
                          Icon(
                            Icons.question_answer,
                            color: Colors.blue,
                            size: 18,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "FAQ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Georgia",
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      _accordianSection(faqData),
                      SizedBox(height: 40),
                      descriptionBox(
                        Icon(
                          Icons.alternate_email,
                          color: Colors.blue,
                          size: 22,
                        ),
                        "Let's Connect",
                        "Have feedback or just want to talk shop? I'm always looking for ways to improve this app for everyone.",
                      ),
                      _contactButton(connectWithMeButtons),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom + 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget descriptionBox(Icon leadingIcon, String title, String description) {
    return Column(
      children: [
        Row(
          children: [
            leadingIcon,
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Georgia",
                fontSize: 20,
              ),
            ),
          ],
        ),
        SizedBox(height: title == "Let's Connect" ? 0 : 12),
        Container(
          padding: EdgeInsets.all(16),
          decoration: title == "Let's Connect"
              ? null
              : BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!, width: 1),
                ),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 15,
              height: 1.3,
              letterSpacing: 0.2,
              color: Colors.black87,
              fontFamily: ".SF Pro Text",
            ),
          ),
        ),
      ],
    );
  }

  Widget _contactButton(List<Map<String, dynamic>> connectWithMeButtons) {
    return Wrap(
      spacing: 8,
      runSpacing: 5,
      children: [
        ...connectWithMeButtons.map(
          (e) => SizedBox(
            width: MediaQuery.widthOf(context) * .4,
            child: ElevatedButton.icon(
              onPressed: () {
                switch (e['label']) {
                  case "Email":
                    // Handle email action
                    break;
                  case "LinkedIn":
                    // Handle LinkedIn action
                    break;
                  case "GitHub":
                    // Handle GitHub action
                    break;
                  case "Support":
                    // Handle Support action
                    break;
                }
              },
              icon: Icon(e['icon'], size: 18, color: Colors.grey[800]),
              label: Text(e['label']),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white30,
                foregroundColor: Colors.black87,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.black12, width: 1),
                ),
                elevation: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _accordianSection(List<Map<String, dynamic>> faqData) {
    return Theme(
      data: Theme.of(context).copyWith(
        visualDensity: VisualDensity(vertical: -4), // Makes tile more compact
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        dividerColor: Colors.transparent,
      ),
      child: Column(
        children: [
          ...faqData.map(
            (e) => ExpansionTile(
              tilePadding: EdgeInsets.symmetric(horizontal: 10),
              childrenPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              iconColor: Colors.black,
              collapsedIconColor: Colors.grey,
              title: Text(
                e['question'],
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              children: [
                Text(
                  e['answer'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
