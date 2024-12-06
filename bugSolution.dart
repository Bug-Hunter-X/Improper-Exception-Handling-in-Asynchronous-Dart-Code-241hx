```dart
Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      print('Error: Failed to load data: ${response.statusCode}');
      return null; // Or throw a custom exception for more specific error handling
    }
  } catch (e) {
    print('Error: $e');
    return null; // Or throw a custom exception
  }
}

void main() async {
  final data = await fetchData().catchError((error) {
      print('Caught error in main: $error');
      return null;
  });

  if (data != null) {
    print('Data fetched successfully: $data');
  } else {
    print('Failed to fetch data.');
  }
}
```