import 'package:intl/intl.dart';

class TaskDateViewmodel {
  static String getSelectedDateAsIso(DateTime? selectedDate) {
    if (selectedDate == null) {
      return "Aucune date sélectionnée";
    }
    return selectedDate.toIso8601String();
  }

  static String getSelectedDateD(DateTime? selectedDate) {
    if (selectedDate == null) {
      return "Aucune date sélectionnée";
    }
    return DateFormat('d MMM', 'fr_FR').format(selectedDate);
  }

  static String formatDate(DateTime? selectedDate, String? selectedTime) {
    if (selectedTime == null) {
      return selectedDate!.toIso8601String();
    }
    return "${DateFormat('yyyy-MM-dd').format(selectedDate!)}T$selectedTime";
  }
}
