import "package:flutter/material.dart";

class ItemNote extends StatelessWidget {
  final Map<String, dynamic> note;
  final void Function(Map<String, dynamic>, int) editNote;
  final void Function(int) deleteNote;
  final int index;
  ItemNote(
      {required this.note,
      required this.editNote,
      required this.deleteNote,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 16),
          Text(
            note['title'] != "" ? note['title']! : "No Name",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            note['content'] ?? "",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 20,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                note['date'],
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    color: Colors.white,
                    onPressed: () {
                      editNote(note, index);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.white,
                    onPressed: () {
                      deleteNote(index);
                    },
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
