import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/main.dart';

import 'preference_state.dart';

class PreferenceCubit extends SafeCubit<PreferenceState> {
  PreferenceCubit() : super(PreferenceState(selectedSubcategories: const {}));

void selectSubcategory({required String subcategory, required String category}) {
    // Create a new map to avoid mutating the current state
    final Map<String, List<String>> updatedMap = Map.from(state.selectedSubcategories);
    final currentSubcategories = List<String>.from(updatedMap[category] ?? []);

    // Toggle the subcategory
    if (currentSubcategories.contains(subcategory)) {
      currentSubcategories.remove(subcategory);
    } else {
      // Check if we've reached the maximum allowed subcategories for this category
      if (currentSubcategories.length >= 3) {
        showSnackBar(
          'You can select maximum 3 subcategories per category',
          type: SnackBarType.warning,
        );
      return;
    }
      currentSubcategories.add(subcategory);
    }

    // Update the map - remove the category if subcategories list is empty
    if (currentSubcategories.isEmpty) {
      updatedMap.remove(category);
    } else {
      updatedMap[category] = currentSubcategories;
  }

    // Emit the new state
    emit(state.copyWith(selectedSubcategories: updatedMap));
  }


}
