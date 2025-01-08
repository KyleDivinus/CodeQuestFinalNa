
import 'dart:convert';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'game_database.db'),
      version: 1,
      onCreate: _createDb,
    );
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE questions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        stage INTEGER NOT NULL,
        question TEXT NOT NULL,
        answers TEXT NOT NULL
      )
    ''');
    await _populateQuestions(db);
  }

  Future<void> _populateQuestions(Database db) async {
    final questions = [
      // Stage 1
       {
        "stage": 1,
        "question": "What is the main programming language used in Flutter?",
        "answers": jsonEncode([
          {"text": "Dart", "isCorrect": true},
          {"text": "JavaScript", "isCorrect": false},
          {"text": "Kotlin", "isCorrect": false},
        ]),
      },
      {
        "stage": 1,
        "question": "What widget is used to display text in Flutter?",
        "answers": jsonEncode([
          {"text": "Button", "isCorrect": false},
          {"text": "Container", "isCorrect": false},
          {"text": "Text", "isCorrect": true},
        ]),
      },

      // Stage 2 questions
      {
        "stage": 2,
        "question": "What is the purpose of the pubspec.yaml file in a Flutter project?",
        "answers": jsonEncode([
          {"text": "To define widget layouts.", "isCorrect": false},
          {"text": "To configure app themes.", "isCorrect": false},
          {"text": "To manage dependencies and metadata.", "isCorrect": true},
        ]),
      },
      {
        "stage": 2,
        "question": "Which method is used to create a new widget in Flutter?",
        "answers": jsonEncode([
          {"text": "build()", "isCorrect": true},
          {"text": "create()", "isCorrect": false},
          {"text": "init()", "isCorrect": false},
        ]),
      },
      {
        "stage": 2,
        "question": "What is the purpose of the Navigator in Flutter?",
        "answers": jsonEncode([
          {"text": "To manage app navigation and routes.", "isCorrect": true},
          {"text": "To handle animations.", "isCorrect": false},
          {"text": "To define app themes.", "isCorrect": false},
        ]),
      },
      {
        "stage": 2,
        "question": "Which keyword is used to import external libraries in Dart?",
        "answers": jsonEncode([
          {"text": "import", "isCorrect": true},
          {"text": "use", "isCorrect": false},
          {"text": "require", "isCorrect": false},
        ]),
      },

      // Stage 3 questions
      {
        "stage": 3,
        "question": "What is the main function in a Flutter app?",
        "answers": jsonEncode([
          {"text": "runApp()", "isCorrect": true},
          {"text": "main()", "isCorrect": false},
          {"text": "startApp()", "isCorrect": false},
        ]),
      },
      {
        "stage": 3,
        "question": "Which widget is used to create a scrollable list?",
        "answers": jsonEncode([
          {"text": "ListView", "isCorrect": true},
          {"text": "Column", "isCorrect": false},
          {"text": "Row", "isCorrect": false},
        ]),
      },
      {
        "stage": 3,
        "question": "How can you define a constant in Dart?",
        "answers": jsonEncode([
          {"text": "const variableName", "isCorrect": true},
          {"text": "final variableName", "isCorrect": false},
          {"text": "static variableName", "isCorrect": false},
        ]),
      },
      {
        "stage": 3,
        "question": "Which widget is commonly used for layouts in Flutter?",
        "answers": jsonEncode([
          {"text": "Column", "isCorrect": true},
          {"text": "Text", "isCorrect": false},
          {"text": "Scaffold", "isCorrect": false},
        ]),
      },
      {
        "stage": 3,
        "question": "What does the keyword 'async' in Dart signify?",
        "answers": jsonEncode([
          {"text": "It marks a function as asynchronous.", "isCorrect": true},
          {"text": "It declares a constant variable.", "isCorrect": false},
          {"text": "It starts a new thread.", "isCorrect": false},
        ]),
      },
      {
        "stage": 3,
        "question": "Which Flutter widget is used to create a customizable button?",
        "answers": jsonEncode([
          {"text": "ElevatedButton", "isCorrect": true},
          {"text": "Container", "isCorrect": false},
          {"text": "Text", "isCorrect": false},
        ]),
      },

      // Stage 4 questions
      {
        "stage": 4,
        "question": "Which of the following correctly describes the async and await keywords?",
        "answers": jsonEncode([
          {"text": "They allow for non-blocking asynchronous code execution.", "isCorrect": true},
          {"text": "They are used for synchronous programming.", "isCorrect": false},
          {"text": "They are only used in StatefulWidget.", "isCorrect": false},
          {"text": "They are used to define constants.", "isCorrect": false},
        ]),
      },
      {
        "stage": 4,
        "question": "What will happen if you call setState() inside the build() method of a StatefulWidget?",
        "answers": jsonEncode([
          {"text": "It will throw an error.", "isCorrect": true},
          {"text": "It will rebuild the widget.", "isCorrect": false},
          {"text": "It will initialize the state.", "isCorrect": false},
          {"text": "It will have no effect.", "isCorrect": false},
        ]),
      },
      {
        "stage": 4,
        "question": "In Dart, what does the keyword 'yield' do in a generator function?",
        "answers": jsonEncode([
          {"text": "It produces a value and pauses the function execution.", "isCorrect": true},
          {"text": "It initializes a variable.", "isCorrect": false},
          {"text": "It creates a new thread.", "isCorrect": false},
          {"text": "It returns a value immediately.", "isCorrect": false},
        ]),
      },
      {
        "stage": 4,
        "question": "Which of the following is a valid way to add padding in Flutter?",
        "answers": jsonEncode([
          {"text": "Using the Padding widget.", "isCorrect": true},
          {"text": "Using the Spacer widget.", "isCorrect": false},
          {"text": "Using the ListView widget.", "isCorrect": false},
          {"text": "Using the Align widget.", "isCorrect": false},
        ]),
      },
      {
        "stage": 4,
        "question": "What is the purpose of the FutureBuilder widget in Flutter?",
        "answers": jsonEncode([
          {"text": "To build widgets based on asynchronous data.", "isCorrect": true},
          {"text": "To manage animations.", "isCorrect": false},
          {"text": "To handle state changes.", "isCorrect": false},
          {"text": "To define navigation routes.", "isCorrect": false},
        ]),
      },
      {
        "stage": 4,
        "question": "In Dart, what does the 'late' keyword signify when declaring a variable?",
        "answers": jsonEncode([
          {"text": "The variable will be initialized later.", "isCorrect": true},
          {"text": "The variable is immutable.", "isCorrect": false},
          {"text": "The variable is a constant.", "isCorrect": false},
          {"text": "The variable is asynchronous.", "isCorrect": false},
        ]),
      },
      {
        "stage": 4,
        "question": "Which operator is used for null-aware access in Dart?",
        "answers": jsonEncode([
          {"text": "?.", "isCorrect": true},
          {"text": "!.", "isCorrect": false},
          {"text": "??", "isCorrect": false},
          {"text": "::", "isCorrect": false},
        ]),
      },
      {
        "stage": 4,
        "question": "What is the purpose of the Provider package in Flutter?",
        "answers": jsonEncode([
          {"text": "To manage state efficiently.", "isCorrect": true},
          {"text": "To handle animations.", "isCorrect": false},
          {"text": "To define themes", "isCorrect": false},
          {"text": "To handle routing.", "isCorrect": false},
        ]),
      },
       { "stage": 4, "question": "Which widget is used to display a simple dialog in Flutter?",
        "answers": jsonEncode([
          {"text": "AlertDialog", "isCorrect": true}, 
          {"text": "DialogBox", "isCorrect": false}, 
          {"text": "SimpleDialog", "isCorrect": false}, 
          {"text": "ShowDialog", "isCorrect": false}, 
        ]), 
      },
        {"stage": 4,"question": "What does the '.of' method do when used with a Flutter widget like MediaQuery or Theme?",
        "answers": jsonEncode([
          {"text": "It retrieves data from an inherited widget.", "isCorrect": true},
          {"text": "It initializes the widget state.", "isCorrect": false},
          {"text": "It rebuilds the widget tree.", "isCorrect": false},
          {"text": "It handles user input.", "isCorrect": false}
        ]),
      },
      
    ];

    for (var question in questions) {
      await db.insert('questions', question);
    }
  }

  Future<List<Map<String, dynamic>>> getQuestionsByStage(int stage) async {
    final db = await database;
    return await db.query(
      'questions',
      where: 'stage = ?',
      whereArgs: [stage],
    );
  }
}
