# <div align="center">📖 Easy Pagination Cubit 📖</div>


## 🚀 Getting Started
- A Flutter application showcasing pagination implementation using the `flutter_bloc` library. This project demonstrates how to efficiently load and display data in chunks, providing a smooth user experience with minimal resource consumption.

<br/>

## 🪄 Features

- **Pagination with Cubit:** Utilize the power of flutter_bloc for efficient state management in paginated scenarios.

- **Efficient Data Loading:** Load data in chunks to minimize the impact on performance.

- **Loading States:** Handle loading states to keep users informed during data fetching.

- **Error Handling:** Gracefully handle errors during data retrieval.

<br/>

## ⚙️ Customization

- Customize the appearance and behavior of the clipboard according to your requirements:

**PaginationCubit:**
```dart
class PaginationCubit extends Cubit<List<dynamic>> {
  PaginationCubit() : super([]);

  int _page = 1;
  bool _isFetching = false;

  Future<void> fetchItems() async {
    if (_isFetching) return;
    _isFetching = true;

    try {
      final response = await Dio().get(
          'https://jsonplaceholder.typicode.com/posts',
          queryParameters: {'_page': _page, '_limit': 10});
      final List<dynamic> items = response.data;
      emit(List.from(state)..addAll(items));
      _page++;
      debugPrint('Page: $_page');
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      debugPrint('Total Fetched Items Num: ${state.length}');
      _isFetching = false;
    }
  }
}
```
<br/>

## 📱 UI


https://github.com/Shalaby-VBS/Easy_Pagination_Cubit/assets/149938388/bf065c96-8030-4d8e-bedb-a7fd2a51a4da


<br/>

## 🛠 Dependencies

```yaml
  flutter_bloc: ^8.0.0
  dio: ^4.0.0
```

<br/>

## 🫴 Contributing

- Contributions are welcome 💜
- If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

<br/>

## 💳 License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/Shalaby-VBS/Easy_Pagination_Cubit)
- This package is distributed under the MIT License. Feel free to use and modify it according to your project requirements.

<br/>

## 🤝 Contact With Me

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ahmed-shalaby-21196521b/) 
[![Gmail](https://img.shields.io/badge/Gmail-333333?style=for-the-badge&logo=gmail&logoColor=red)](https://www.shalaby.vbs@gmail.com)
[![Facebook](https://img.shields.io/badge/Facebook-0077B5?style=for-the-badge&logo=facebook&logoColor=white)](https://www.facebook.com/profile.php?id=100093012790432&mibextid=hIlR13)
[![Instagram](https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white)](https://www.instagram.com/sh4l4by/)

<br/>

## 💖 Support

- If you find this tutorial useful or learned something from this code, consider show some ❤️ by starring this repo.
