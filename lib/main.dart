import 'package:flutter/material.dart';
import 'widgets/item_note.dart';
import 'pages/add_note.dart';
import 'pages/update_note.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => SplashPage(),
      '/home': (context) => Home(),
      '/create': (context) => AddNote()},
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyNoteState();
}

class _MyNoteState extends State<Home> {
  List<Map<String, dynamic>> catatan = [];

  void _tambahCatatan() async {
    final hasil = await Navigator.pushNamed(context, "/create");

    if(hasil != null && hasil is Map<String, dynamic>) {
      setState(() {
        catatan.add(hasil); 
      });
    }
  }

  void _editCatatan(Map<String, dynamic> note, int index) async {
    final hasil = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateNote(note: note),
      ),
    );

    if(hasil != null) {
      setState(() {
        catatan[index] = hasil;        
      });
    }
  }

  void _deleteConfirmation(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Hapus Catatan"),
          content: Text("Apakah anda yakin ingin menghapus catatan ?"),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: (){
                setState(() {
                  catatan.removeAt(index);        
                });
                Navigator.pop(context);
              },
              child: Text("Hapus"),
            ),
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25,
        ),
        title: Text("Notes App"),
      ),
      body:Padding(
        padding: EdgeInsets.all(20),
        child: catatan.isEmpty 
        ? Center(
          child: Text(
            "Tidak ada catatan yang dibuat",
            style: TextStyle(fontSize: 16),
          ),
         )
         : ListView.builder(
          itemCount: catatan.length,
          itemBuilder: (context, index) {
            final note = catatan[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ItemNote(
                note: note,
                editNote: _editCatatan,
                deleteNote: _deleteConfirmation,
                index: index
                )
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahCatatan,
        backgroundColor: Color.fromARGB(255, 48, 153, 214),
        child: Icon(Icons.add, size: 40, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
        BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.blue,
          child: Container(
            height: 55,
          ),
        ),
    );
  }
}
