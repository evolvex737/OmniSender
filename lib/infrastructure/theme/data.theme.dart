part of 'main.theme.dart';

final ThemeData evolvexTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF43B02A), // Hijau Evolvex
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Roboto', // atau sesuaikan dengan identitas brand kamu

  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xFF43B02A),
    secondary: const Color(0xFF2E7D32), // hijau lebih gelap sebagai accent
    error: Colors.redAccent,
    background: Colors.white,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF43B02A),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF43B02A),
    ),
  ),

  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all(const Color(0xFF43B02A)),
  ),

  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF43B02A), width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    labelStyle: const TextStyle(color: Color(0xFF2E7D32)),
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF43B02A),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
);

final ThemeData evolvexDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF43B02A), // Hijau Evolvex
  scaffoldBackgroundColor: const Color(0xFF121212),
  fontFamily: 'Roboto',

  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF43B02A),
    secondary: Color(0xFF66BB6A),
    background: Color(0xFF121212),
    surface: Color(0xFF1E1E1E),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onBackground: Colors.white70,
    onSurface: Colors.white70,
    error: Colors.redAccent,
    onError: Colors.white,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E),
    foregroundColor: Colors.white,
    elevation: 1,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF43B02A),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF43B02A),
    ),
  ),

  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all(const Color(0xFF43B02A)),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1E1E1E),
    labelStyle: const TextStyle(color: Color(0xFF66BB6A)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF43B02A), width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
  ),

  cardColor: const Color(0xFF1E1E1E),
  dividerColor: Colors.white10,
  iconTheme: const IconThemeData(color: Color(0xFF66BB6A)),
);
