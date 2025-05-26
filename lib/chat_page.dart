import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ChatPage extends StatefulWidget {
  final String namaPetugas;
  const ChatPage({super.key, required this.namaPetugas});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  File? _image;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
        _messages.add({'type': 'image', 'file': _image});
      });
    }
  }

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _messages.add({'type': 'text', 'text': _controller.text});
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 1,
        leading: const CircleAvatar(
          child: Icon(Icons.person, color: Color(0xFF14482F)),
        ),
        title: Text(widget.namaPetugas,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            )),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF14482F)),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/petugas');
            },
          ),
        ],
      ),
      body: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    // Status online/offline
    Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.green[100],
      child: const Text(
        'Petugas sedang online',
        style: TextStyle(
          color: Color(0xFF14482F),
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Pesan
    Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          final message = _messages[index];
          if (message['type'] == 'text') {
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF14482F),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  message['text'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            );
          } else if (message['type'] == 'image') {
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF14482F), width: 3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(message['file'], fit: BoxFit.cover),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    ),

    // Input Bar
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: const Border(top: BorderSide(color: Colors.grey)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF14482F),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: _controller,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Tulis pesan...',
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.emoji_emotions_outlined),
            onPressed: () {},
            color: const Color(0xFF14482F),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _pickImage,
            color: const Color(0xFF14482F),
          ),
          IconButton(
            icon: const Icon(Icons.mic),
            onPressed: () {},
            color: const Color(0xFF14482F),
          ),
        ],
      ),
    ),
  ],
),

    );
  }
}
