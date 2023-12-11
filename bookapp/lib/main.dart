import 'package:bookapp/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeMode _themeMode = ThemeMode.light;

  void changeTheme(int v) {
    setState(() {
      if (v == 0)
        _themeMode = ThemeMode.dark;
      else
        _themeMode = ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _themeMode,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromRGBO(3, 69, 151, 1),
        ),
      ),
      darkTheme: ThemeData.dark(),
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext context) => FirstPage(changeTheme: changeTheme),
        "/Add": (BuildContext context) => Add(changeTheme: changeTheme),
        "/Book": (BuildContext context) => book_lists(changeTheme: changeTheme),
        "/About": (BuildContext context) =>
            profile_page(changeTheme: changeTheme),
      },
      initialRoute: "/home",
    );
  }
}

class DrawerWidget extends StatefulWidget {
  final Function(int) f;

  DrawerWidget({required this.f});

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                "Home",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () => {Navigator.pushNamed(context, "/home")},
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                "Add",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () => {Navigator.pushNamed(context, "/Add")},
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                "Books",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () => {Navigator.pushNamed(context, "/Book")},
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                "About",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () => {Navigator.pushNamed(context, "/About")},
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.065,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                "Dark Mode",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              Switch(
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                    if (_value)
                      widget.f(0);
                    else
                      widget.f(1);
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  final Function(int) changeTheme;

  FirstPage({required this.changeTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: DrawerWidget(f: changeTheme),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Color.fromRGBO(253, 200, 67, 1.0),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Center(
                child: Text(
                  "LitHub",
                  style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Every book has a story, every story finds a home in LitHub.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class book {
  String name, author, summary;
  book(this.name, this.author, this.summary);
}

List<book> books = [
  book("Harry Potter", "J.K.Rowling",
      "The Harry Potter series follows the magical journey of a young wizard, Harry, and his friends as they confront dark forces threatening the wizarding world. Attending Hogwarts School of Witchcraft and Wizardry, Harry discovers his destiny and battles the dark wizard Lord Voldemort. With themes of friendship, courage, and the triumph of good over evil, the series consists of seven books detailing Harry's growth and the ultimate showdown with Voldemort. J.K. Rowling's enchanting storytelling has captivated readers globally, making Harry Potter a cultural phenomenon"),
  book("Daddy Long Legs", "Jean Webster",
      "written by Jean Webster, is a classic novel that tells the story of Jerusha Abbott, a young orphan with a flair for writing. An anonymous benefactor offers to fund her college education under one condition: she must write him regular letters about her experiences. Jerusha, nicknamed Judy, enters college with a mix of excitement and trepidation, forming friendships and discovering her own identity along the way. Through her witty and candid letters, the novel explores themes of self-discovery, education, and the transformative power of literature. The unfolding relationship between Judy and her mysterious benefactor adds a touch of romance and intrigue to this charming coming-of-age tale."),
  book("The 5 AM Club", "Robin Sharma",
      "a self-help book by Robin Sharma, advocates for a morning routine that begins at 5 AM to enhance productivity and personal development. The book follows the journey of a struggling artist, an entrepreneur, and a tycoon who come together to form the 5 AM Club, guided by a billionaire mentor. The narrative emphasizes the power of early rising, goal-setting, and mindfulness to achieve success. Sharma's teachings encourage readers to embrace the discipline of the 5 AM routine as a catalyst for positive life transformations, fostering a mindset of focus, purpose, and fulfillment."),
  book("Think Again", "Adam Grant",
      "Think Again is a book by organizational psychologist and Wharton professor Adam Grant. In this insightful work, Grant challenges the concept of maintaining unwavering opinions and encourages the practice of rethinking. He explores the importance of being open to changing one's mind, reassessing beliefs, and embracing intellectual flexibility. Grant delves into the psychology of learning from mistakes, adapting to new information, and fostering a culture that values curiosity and continuous learning.Think Again serves as a guide to navigating the complexities of the modern world by promoting a mindset that is open, adaptable, and receptive to the power of reconsideration."),
  book("Me Before You", "Jojo Moyes",
      "Me Before Youis a novel by Jojo Moyes that tells the emotional story of Louisa Clark, a young woman who becomes a caregiver for Will Traynor, a quadriplegic man. As they spend time together, a deep and transformative relationship develops between them. The novel explores themes of love, choices, and the impact of life-altering decisions. Set against the backdrop of their small town,Me Before You is a poignant and thought-provoking narrative that delves into the complexities of human connection and the pursuit of a meaningful life. Moyes skillfully weaves together humor, heartbreak, and hope in this touching tale."),
  book("The Night Circus", "Erin Morgenstern",
      "This novel is a mesmerizing fantasy that follows the mysterious competition between two illusionists, Celia and Marco, who are bound by a magical challenge from childhood. Set in a magical, black-and-white circus that appears without warning, the story unfolds with enchanting prose, intricate plotting, and a touch of romance. The Night Circus explores themes of love, destiny, and the nature of art, creating a captivating and immersive reading experience."),
  book("Sapiens: A Brief History of Humankind", "Yuval Noah Harari",
      "From the origins of our species in Africa to the present day, Harari explores major revolutions, including agriculture and industry, and their impact on human societies. The book delves into the development of cultural constructs like religion and money, emphasizing their influence on shaping collective beliefs and behaviors. With a compelling narrative and insightful analysis,Sapiens offers a thought-provoking perspective on the evolution of Homo sapiens and the forces that have shaped the course of human history. Harari's accessible writing style makes complex ideas accessible to a wide audience"),
];

class Add extends StatefulWidget {
  final Function(int) changeTheme;

  Add({required this.changeTheme});
  @override
  State<Add> createState() => _Add();
}

class _Add extends State<Add> {
  TextEditingController nameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController sumarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Book')),
      drawer: DrawerWidget(f: widget.changeTheme),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: authorController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Author',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: sumarController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'summary',
                  contentPadding: EdgeInsets.symmetric(vertical: 40.0),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                String b = nameController.text;
                String a = authorController.text;
                String s = sumarController.text;

                if (b.isNotEmpty && a.isNotEmpty && s.isNotEmpty) {
                  books.add(book(b, a, s));

                  Navigator.pop(context, {
                    'Bname': b,
                    'Aname': a,
                    'Cname': s,
                  });
                } else {
                  print("Error: Please fill in all fields");
                }
              },
              child: Text(
                'ADD NEW BOOK',
                style: TextStyle(
                  color: Color.fromRGBO(253, 200, 67, 1.0),
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class book_lists extends StatelessWidget {
  final Function(int) changeTheme;

  book_lists({required this.changeTheme});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      drawer: DrawerWidget(
        f: changeTheme,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(6.0), // Adjust margin for spacing
              padding: EdgeInsets.all(8.0), // Adjust padding for each book
              decoration: BoxDecoration(
                  // color: Color(0xFFffffff),
                  // border: Border.all(
                  //     color: Color.fromRGBO(221, 221, 221, 1)),
                  // // Add a border
                  color: Theme.of(context)
                      .scaffoldBackgroundColor, // Use the scaffold background color from the theme
                  border: Border.all(
                    color: Theme.of(context)
                        .dividerColor, // Use the divider color from the theme
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x4e4d49).withOpacity(1),
                      offset: Offset(0, 6),
                      blurRadius: 5,
                      spreadRadius: -3,
                    )
                  ] // Add border radius
                  ),

              child: ListTile(
                title: Text(
                  books[index].name,
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          book_page(books[index], changeTheme: changeTheme),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class book_page extends StatefulWidget {
  final book b;
  final Function(int) changeTheme;

  book_page(this.b, {required this.changeTheme});

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<book_page> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      drawer: DrawerWidget(f: widget.changeTheme),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.5,
                          ),
                        ),
                      ),
                      child: Text(
                        widget.b.name,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.12,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Written by: ${widget.b.author}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.07,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      '${widget.b.summary}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            rating = index + 1;
                          });
                        },
                        child: Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          color: Color.fromRGBO(253, 200, 67, 1.0),
                          size: 40.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.012,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(3, 69, 151, 1),
                      ),
                      onPressed: () {
                        setState(() {
                          rating = 0;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Thanks for rating'),
                            duration: Duration(seconds: 1),
                            backgroundColor: Color.fromRGBO(3, 69, 151,
                                1), // You can customize the duration
                          ),
                        );
                      },
                      child: Text('Submit'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
