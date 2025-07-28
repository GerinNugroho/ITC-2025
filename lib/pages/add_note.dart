import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat("dd-MM-yyyy  HH:mm").format(now);

    void _simpanCatatan() {
      String title = titleController.text;
      String date = formattedDate;
      String content = contentController.text;

      final catatanBaru = {
        'title': title,
        'date': date,
        'content': content 
      };

      Navigator.pop(context, catatanBaru); 
    }

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
                  hintText: "Title"
                ),
              )
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  hintText: "$formattedDate"
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
        onPressed: _simpanCatatan,
        backgroundColor: Color.fromARGB(255, 48, 153, 214),
        child: Icon(Icons.save, color: Colors.white, size: 30),
      ),
    );
  }
}