import 'package:flutter/material.dart';

class DokterAIPage extends StatefulWidget {
  const DokterAIPage({super.key});

  @override
  State<DokterAIPage> createState() => _DokterAIPageState();
}

class _DokterAIPageState extends State<DokterAIPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _chat = []; // {"role": "user"/"ai", "text": "..."}

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _chat.add({"role": "user", "text": text});
      _chat.add({
        "role": "ai",
        "text": "Ini adalah jawaban dari Dokter AI berdasarkan pertanyaan: \"$text\""
      });
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tanya Dokter AI', style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: const Color(0xFF14482F),
        foregroundColor: Colors.white,
        actionsPadding: EdgeInsets.all(10),
        actions: [
          Padding(padding: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Icon(Icons.medical_services, color: Color(0xFF14482F)),
          )
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(30),
              itemCount: _chat.length,
              itemBuilder: (context, index) {
                final msg = _chat[index];
                final isUser = msg['role'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.green[300] : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      msg['text']!,
                      style: const TextStyle(fontFamily: 'Poppins'),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Tulis pertanyaan Anda...',
                      hintStyle: const TextStyle(fontFamily: 'Poppins'),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send, color: Color(0xFF14482F)),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFEAEAEA),
    );
  }
}
