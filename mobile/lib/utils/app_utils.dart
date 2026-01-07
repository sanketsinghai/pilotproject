// Utility functions for the app
class AppUtils {
  // Format currency
  static String formatCurrency(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }

  // Format date
  static String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  // Get distance between two points
  static double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadiusKm = 6371;
    final double dLat = _toRadians(lat2 - lat1);
    final double dLon = _toRadians(lon2 - lon1);
    final double a = (Math.sin(dLat / 2) * Math.sin(dLat / 2)) +
        (Math.cos(_toRadians(lat1)) * Math.cos(_toRadians(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2));
    final double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return earthRadiusKm * c;
  }

  static double _toRadians(double degrees) {
    return degrees * (3.141592653589793 / 180);
  }

  // Truncate string
  static String truncate(String text, {int length = 50}) {
    if (text.length <= length) return text;
    return '${text.substring(0, length)}...';
  }

  // Validate email
  static bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // Validate phone
  static bool isValidPhone(String phone) {
    final RegExp phoneRegex = RegExp(r'^[+]?[(]?[0-9]{3}[)]?[-\s.]?[0-9]{3}[-\s.]?[0-9]{4,6}$');
    return phoneRegex.hasMatch(phone);
  }
}

class Math {
  static double sin(double x) => throw UnimplementedError();
  static double cos(double x) => throw UnimplementedError();
  static double atan2(double y, double x) => throw UnimplementedError();
  static double sqrt(double x) => throw UnimplementedError();
}
