import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpdateNote extends StatefulWidget {
  final Map<String, dynamic> note;
  const UpdateNote({
    super.key,
    required this.note
  });

  @override
  State<UpdateNote> createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  String formattedDate = DateFormat("dd-MM-yyyy  HH:mm").format(DateTime.now());

  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note['title']?.toString() ?? '');
    contentController = TextEditingController(text: widget.note['content']?.toString() ?? '');
  }

  void _simpanNote() {
    final updatedNote = {
      'title': titleController.text.isEmpty
        ? widget.note['title'].toString()
        : titleController.text,
      'date': formattedDate,
      'content': contentController.text.isEmpty
        ? widget.note['content'].toString()
        : contentController.text,
    };

    Navigator.pop(context, updatedNote);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Add Note", 
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white
          )
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: TextField(
                controller: titleController,
                style: TextStyle(
                  fontSize: 30
                ),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Title",
                ),
              )
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  hintText: "$formattedDate",
                ),
              )
            ),
            Expanded(
              child: TextField(
                controller: contentController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Buat catatan mu disini!",
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _simpanNote,
        backgroundColor: Color.fromARGB(255, 48, 153, 214),
        child: Icon(Icons.save, color: Colors.white, size: 30),
      ),
    );
  }
}