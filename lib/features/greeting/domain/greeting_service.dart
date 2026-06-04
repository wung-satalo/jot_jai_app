class GreetingService {
  static String getGreeting(DateTime now) {
    final hour = now.hour;
    if (hour <= 6 && hour < 12) {
      return "Good morning";
    } else if (hour >= 12 && hour < 18) {
      return "Good Afternoon";
    } else if (hour >= 18 && hour < 24) {
      return "Good evening";
    } else {
      return "Good Night";
    }
  }
}
