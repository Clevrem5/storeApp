import 'package:hive/hive.dart';
import 'package:store_app/data/models/home_models/home_page_model.dart';
import 'package:store_app/data/repository/search/search_interface.dart';

class SearchRepositoryLocal implements ISearchRepository {
  final Box<String> historyBox = Hive.box<String>('searchHistory'); // qidiruv tarixini saqlash uchun

  @override
  Future<List<ProductsModel>> fetchSearch(String? title) async {
    if (title != null && title.isNotEmpty) {
      await saveSearchQuery(title);  // Yangi qidiruv so'zini saqlash
    }

    // Bu yerda o'z qidiruv logikangizga mos ravishda "ProductsModel"ni qaytarishingiz mumkin
    return [];
  }

  // Yangi qidiruv so'zini tarixga saqlash
  Future<void> saveSearchQuery(String title) async {
    final values = historyBox.values.toList();
    final existingIndex = values.indexOf(title);

    // Agar so'z tarixda bo'lsa, uni yangilash
    if (existingIndex != -1) {
      await historyBox.deleteAt(existingIndex);
    }

    await historyBox.add(title);  // Yangi so'zni qo'shish

    // 10 ta so'zdan oshmasligini ta'minlash
    while (historyBox.length > 10) {
      await historyBox.deleteAt(0);
    }
  }

  @override
  Future<List<String>> getSearchHistory() async {
    // Tarixni teskari tartibda (so'nggi qidiruv birinchi) chiqarish
    return historyBox.values.toList().reversed.toList();
  }//

  @override
  Future<void> clearHistory() async {
    await historyBox.clear();
  }

  @override
  Future<void> deleteSearchItem(String title) async {
    final updatedHistory = historyBox.values.toList()..remove(title);
    await historyBox.clear();
    await historyBox.addAll(updatedHistory);
  }
}
