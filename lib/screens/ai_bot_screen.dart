import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AiBotScreen extends StatefulWidget {
  const AiBotScreen({super.key});

  @override
  State<AiBotScreen> createState() => _AiBotScreenState();
}

class _AiBotScreenState extends State<AiBotScreen> {
  final TextEditingController _messageController = TextEditingController();

  // If you want to do something while the user is typing (like searching for a specific exercise in your gym app),
  //you can add a listener in your initState:

  // @override
  // void initState() {
  //   super.initState();
  //   _messageController.addListener(() {
  //     print("Current text: ${_messageController.text}");
  //   });
  // }

  @override
  void dispose() {
    _messageController.dispose(); //  cleaning up text editing controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 360),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.smart_toy_outlined,
                          size: 40,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Gym Buddy",
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Get personalized workout advice, nutrition tips, and motivation from your AI assistant",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  border: Border.all(
                    color: const Color.fromARGB(
                      255,
                      221,
                      219,
                      219,
                    ), // border color
                    width: 1, // border width
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ), // rounded corners
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.smart_toy_outlined,
                        size: 25,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "AI Gym Buddy",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      left: BorderSide(
                        color: const Color.fromARGB(
                          255,
                          221,
                          219,
                          219,
                        ), // border color
                        width: 1, // border width
                      ),
                      right: BorderSide(
                        color: const Color.fromARGB(
                          255,
                          221,
                          219,
                          219,
                        ), // border color
                        width: 1, // border width
                      ),
                      bottom: BorderSide(
                        color: const Color.fromARGB(
                          255,
                          221,
                          219,
                          219,
                        ), // border color
                        width: 1, // border width
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ), // rounded corners
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        botMessage(
                          "👋 Hi! I'm your AI Fitness Coach. I'm here to help you with workout plans, nutrition guidance, form tips, and motivation. What fitness goals are you working towards today?",
                        ),
                        SizedBox(height: 14),
                        userMessage(
                          "I want to build muscle and improve my strength!",
                        ),
                        SizedBox(height: 14),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _messageController,
                          decoration: const InputDecoration(
                            hintText: "Type a message...",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none, // Removes the underline
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: Colors.black54,
                      radius: 24,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: () {
                          String userResponse = _messageController.text;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Message Sent"),
                                content: Text(
                                  userResponse.isNotEmpty
                                      ? "You said $userResponse"
                                      : "Your response was empty.",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                          _messageController.clear();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget botMessage(String message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.smart_toy_outlined,
                size: 25,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      message,
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    DateFormat('hh:mm a').format(DateTime.now()),
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget userMessage(String userMessage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  userMessage,
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(width: 12),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person_outline_outlined,
                size: 25,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          DateFormat('hh:mm a').format(DateTime.now()),
          style: TextStyle(fontSize: 11, color: Colors.grey),
        ),
      ],
    );
  }
}
