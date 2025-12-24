# PHASE 2: Mobile Development Guide

**Status**: In Progress 🔄  
**Timeline**: 2-3 weeks  
**Target**: 16 Screens + Backend Integration  
**Framework**: Flutter 3.x + Riverpod + Hive  

---

## 📱 SCREENS TO BUILD (16 Total)

### Authentication (2 screens)
- [ ] 1. Login Screen
- [ ] 2. Signup Screen

### Home & Navigation (2 screens)
- [ ] 3. Home Screen with Bottom Navigation
- [ ] 4. Navigation Drawer

### Temples Module (3 screens)
- [ ] 5. Temples List (state-wise filtered)
- [ ] 6. Temple Detail (with photos, directions)
- [ ] 7. Nearby Temples (using location)

### Granths/Sacred Texts (3 screens)
- [ ] 8. Granths Library (language/category filtered)
- [ ] 9. Granth Reader (with PDF/offline support)
- [ ] 10. Search/Full-text Search

### Dharamshalas (2 screens)
- [ ] 11. Dharamshala List (with amenities)
- [ ] 12. Dharamshala Booking/Details

### Trip Planner (2 screens)
- [ ] 13. My Trips List
- [ ] 14. Trip Detail (with map, itinerary)

### Kids Pathshala (1 screen)
- [ ] 15. Pathshala Lessons (age-group filtered)
- [ ] 16. Lesson Detail with Quiz

### User Profile (1 screen)
- [ ] 17. User Profile & Settings

---

## 📁 RECOMMENDED FOLDER STRUCTURE

```
mobile/
├── lib/
│   ├── main.dart                      # App entry point
│   ├── config/
│   │   ├── routes.dart                # Go Router configuration
│   │   ├── theme.dart                 # App theme & colors
│   │   └── constants.dart             # App constants
│   ├── models/
│   │   ├── temple_model.dart
│   │   ├── granth_model.dart
│   │   ├── dharamshala_model.dart
│   │   ├── trip_model.dart
│   │   ├── pathshala_model.dart
│   │   ├── user_model.dart
│   │   └── api_response_model.dart
│   ├── services/
│   │   ├── api_service.dart           # API client (dio)
│   │   ├── auth_service.dart
│   │   ├── firestore_service.dart
│   │   ├── location_service.dart
│   │   └── offline_service.dart       # Hive local storage
│   ├── providers/
│   │   ├── auth_provider.dart         # Riverpod auth state
│   │   ├── temple_provider.dart
│   │   ├── granth_provider.dart
│   │   ├── dharamshala_provider.dart
│   │   ├── trip_provider.dart
│   │   ├── pathshala_provider.dart
│   │   └── location_provider.dart
│   ├── widgets/
│   │   ├── common/
│   │   │   ├── loading_widget.dart
│   │   │   ├── error_widget.dart
│   │   │   ├── empty_state.dart
│   │   │   └── custom_button.dart
│   │   ├── temple_card.dart
│   │   ├── granth_card.dart
│   │   └── trip_card.dart
│   ├── screens/
│   │   ├── auth/
│   │   │   ├── login_screen.dart
│   │   │   └── signup_screen.dart
│   │   ├── home/
│   │   │   ├── home_screen.dart
│   │   │   └── main_navigation.dart
│   │   ├── temples/
│   │   │   ├── temples_list_screen.dart
│   │   │   ├── temple_detail_screen.dart
│   │   │   └── nearby_temples_screen.dart
│   │   ├── granths/
│   │   │   ├── granths_library_screen.dart
│   │   │   ├── granth_reader_screen.dart
│   │   │   └── granth_search_screen.dart
│   │   ├── dharamshalas/
│   │   │   ├── dharamshala_list_screen.dart
│   │   │   └── dharamshala_detail_screen.dart
│   │   ├── trips/
│   │   │   ├── trips_list_screen.dart
│   │   │   └── trip_detail_screen.dart
│   │   ├── pathshala/
│   │   │   ├── lessons_screen.dart
│   │   │   └── lesson_detail_screen.dart
│   │   └── profile/
│   │       └── profile_screen.dart
│   └── utils/
│       ├── extensions.dart
│       ├── validators.dart
│       └── formatters.dart
├── assets/
│   ├── images/
│   ├── icons/
│   └── fonts/
├── test/
│   ├── widget_test.dart
│   └── integration_test/
├── pubspec.yaml
└── README.md
```

---

## 🔧 SETUP CHECKLIST

Before starting screens:

- [ ] Flutter SDK installed (3.16+)
- [ ] VS Code Flutter extension
- [ ] Android Studio / Xcode setup
- [ ] Firebase project created
- [ ] Backend running (http://localhost:8000)
- [ ] .env file with Firebase config
- [ ] `flutter pub get` executed

**Quick Setup**:
```bash
cd mobile
flutter pub get
flutter run -d chrome    # Test in browser first
```

---

## 📋 BUILD ORDER (Recommended)

### Week 1: Core Setup + Auth
- [ ] 1. Models (api_response_model.dart)
- [ ] 2. API Service (dio client)
- [ ] 3. Auth Service + Riverpod provider
- [ ] 4. Login Screen
- [ ] 5. Signup Screen
- [ ] 6. Auth Routes in main.dart

### Week 2: Core Features
- [ ] 7. Home Screen + Navigation
- [ ] 8. Temples List + Detail screens
- [ ] 9. Granths Library + Reader
- [ ] 10. Dharamshalas module

### Week 3: Advanced Features
- [ ] 11. Trip Planner
- [ ] 12. Pathshala/Kids Learning
- [ ] 13. User Profile
- [ ] 14. Offline Sync (Hive)
- [ ] 15. Testing + Bug fixes

---

## 🎨 UI/UX GUIDELINES

### Color Scheme
```
Primary:    #8B4513 (Jain Saffron Brown)
Secondary:  #FFD700 (Gold)
Accent:     #DC143C (Crimson)
Background: #F5F5F5
Text:       #333333
Muted:      #999999
```

### Typography
- **Header**: 28px, Bold
- **Subtitle**: 18px, SemiBold
- **Body**: 14px, Regular
- **Caption**: 12px, Regular

### Spacing
- **Padding**: 16px (standard)
- **Margin**: 8px (between items)
- **Border Radius**: 12px (cards)

### Icons
- Use `flutter_icons` for Material Design icons
- Custom Jain-specific icons (optional, can use Unicode)

---

## 🔌 API INTEGRATION PATTERN

### Standard Response Handling
```dart
// All API responses follow this pattern:
{
  "status": "success",
  "code": 200,
  "data": [...],
  "message": "Data retrieved"
}
```

### Error Handling
```dart
try {
  final response = await apiService.get('/temples');
  // Handle response
} catch (e) {
  // Show error message
  ScaffoldMessenger.show('Error: ${e.message}');
}
```

### Offline Support
```dart
// Try API first, fall back to Hive cache
final cachedData = await hiveService.getTemples();
if (cachedData != null) {
  return cachedData;
}
// If online, fetch and cache
```

---

## 📱 STATE MANAGEMENT (Riverpod)

### Provider Pattern
```dart
// Read-only state
final templeListProvider = FutureProvider<List<Temple>>((ref) async {
  return await apiService.getTemples();
});

// Mutable state
final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});

// Computed state
final filteredTempleProvider = Provider<List<Temple>>((ref) {
  final temples = ref.watch(templeListProvider).value ?? [];
  final filter = ref.watch(filterProvider);
  return temples.where((t) => t.state == filter.state).toList();
});
```

### Usage in Widgets
```dart
class TempleList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temples = ref.watch(templeListProvider);
    
    return temples.when(
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => ErrorWidget(error: err),
      data: (data) => ListView(children: [...]),
    );
  }
}
```

---

## 🗄️ LOCAL STORAGE (Hive)

### Data to Cache Offline
```dart
// Hive boxes
- temples.box      (all temples list)
- granths.box      (all granths)
- user.box         (current user)
- favorites.box    (favorite temples/granths)
- offline_trips.box (drafts)
```

### Sync Strategy
```
1. App starts → Check if online
2. If online → Fetch fresh data → Save to Hive
3. If offline → Use Hive cache
4. When online again → Sync pending changes
```

---

## 🧪 TESTING CHECKLIST

After building each screen:
- [ ] Screen loads without errors
- [ ] All buttons responsive
- [ ] Form validation works
- [ ] Data displays correctly
- [ ] API calls working
- [ ] Offline mode functional
- [ ] Back navigation works
- [ ] No memory leaks

---

## 🚀 DEVELOPMENT WORKFLOW

### Daily Standup
1. Check which screen(s) to build
2. Reference [API_TESTING_GUIDE.md](./backend/API_TESTING_GUIDE.md) for endpoints
3. Test endpoint in Swagger first
4. Build screen in Flutter
5. Test with backend running
6. Commit to git

### Git Workflow
```bash
git checkout -b feature/login-screen
# Make changes
git add .
git commit -m "feat: add login screen"
git push origin feature/login-screen
# Create PR
```

### Testing During Development
```bash
# Run hot reload
flutter run

# Run with web browser (faster)
flutter run -d chrome

# Build release
flutter build apk      # Android
flutter build ios      # iOS (Mac only)
```

---

## 📦 DEPENDENCIES READY

From pubspec.yaml (all already added):
```
✅ firebase (auth, firestore, storage)
✅ riverpod (state management)
✅ hive (offline storage)
✅ flutter_map (OpenStreetMap)
✅ flutter_tts (text-to-speech)
✅ pdfx (PDF viewing)
✅ go_router (navigation)
✅ dio (HTTP client)
✅ geolocator (location)
✅ image_picker (photos)
✅ intl (internationalization)
✅ shared_preferences (simple storage)
```

**No additional packages needed!**

---

## 📊 PROGRESS TRACKING

Update this as you complete screens:

### Week 1
- [ ] Models
- [ ] API Service
- [ ] Auth
- [ ] Login/Signup
- [ ] Home

### Week 2
- [ ] Temples
- [ ] Granths
- [ ] Dharamshalas

### Week 3
- [ ] Trips
- [ ] Pathshala
- [ ] Profile
- [ ] Testing

---

## 🎯 SUCCESS CRITERIA

Phase 2 complete when:
- ✅ All 16 screens built
- ✅ All screens connected to backend
- ✅ Offline mode functional
- ✅ No console errors
- ✅ Smooth navigation
- ✅ Fast load times
- ✅ Ready for testing

---

## 💡 TIPS & TRICKS

1. **Use Flutter DevTools** for debugging:
   ```bash
   flutter pub global activate devtools
   devtools
   ```

2. **Hot Reload** for faster development:
   - Press `r` in terminal
   - Change code, save
   - See changes immediately

3. **Check API first** in Swagger before building:
   - Understand request format
   - Know response structure
   - Test with real data

4. **Build cards/widgets** as reusable components:
   - TempleCard widget (reuse in list + favorites)
   - GranthCard widget
   - Custom button widget

5. **Mock data during development**:
   ```dart
   final mockTemples = [
     Temple(
       id: '1',
       name: 'Lal Mandir',
       state: 'Delhi',
       // ...
     ),
   ];
   ```

6. **Use constants** for strings:
   ```dart
   class AppStrings {
     static const login = 'Login';
     static const temples = 'Temples';
     // Reuse everywhere
   }
   ```

---

## 📞 QUICK REFERENCE

| Need | Location |
|------|----------|
| API Endpoints | backend/API_TESTING_GUIDE.md |
| Data Schema | DATA_SCHEMA.md |
| Tech Info | TECH_STACK.md |
| Setup Help | SETUP_GUIDE.md |
| Quick Commands | QUICK_REFERENCE.md |

---

## 🎊 YOU'RE READY!

All backend endpoints are ready. All packages are installed.

**Let's build the app! 🚀**

Start with: [1. Create Models](#-build-order-recommended)
