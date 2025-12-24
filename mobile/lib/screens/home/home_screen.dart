import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/theme.dart';
import '../../services/auth_service.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _sections = [
    {'label': 'Temples', 'icon': Icons.temple_buddhist, 'route': 'temples'},
    {'label': 'Granths', 'icon': Icons.book, 'route': 'granths'},
    {'label': 'Stays', 'icon': Icons.hotel, 'route': 'dharamshalas'},
    {'label': 'Trips', 'icon': Icons.map, 'route': 'trips'},
    {'label': 'Learning', 'icon': Icons.school, 'route': 'pathshala'},
    {'label': 'Profile', 'icon': Icons.person, 'route': 'profile'},
  ];

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Digamber Jain'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              Text(
                'Welcome back,\n${currentUser?.displayName ?? "Follower"}! 🙏',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
              ),
              const SizedBox(height: AppTheme.paddingLarge),

              // Quick stats
              _buildStatsSection(context),
              const SizedBox(height: AppTheme.paddingLarge),

              // Main sections grid
              Text(
                'Explore',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: AppTheme.paddingMedium),
              _buildSectionsGrid(context),
              const SizedBox(height: AppTheme.paddingLarge),

              // Quick access
              Text(
                'Quick Access',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: AppTheme.paddingMedium),
              _buildQuickAccessCards(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.paddingMedium),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Temples', '1000+', context),
          _buildStatItem('Granths', '500+', context),
          _buildStatItem('Followers', '50K+', context),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildSectionsGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        crossAxisSpacing: AppTheme.paddingMedium,
        mainAxisSpacing: AppTheme.paddingMedium,
      ),
      itemCount: _sections.length,
      itemBuilder: (context, index) {
        final section = _sections[index];
        return GestureDetector(
          onTap: () => context.go('/home/${section['route']}'),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  section['icon'],
                  size: 40,
                  color: AppTheme.primaryColor,
                ),
                const SizedBox(height: 8),
                Text(
                  section['label'],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuickAccessCards(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.favorite, color: AppTheme.accentColor),
            title: const Text('My Favorites'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Coming soon!')),
              );
            },
          ),
        ),
        const SizedBox(height: AppTheme.paddingMedium),
        Card(
          child: ListTile(
            leading: const Icon(Icons.bookmark, color: AppTheme.secondaryColor),
            title: const Text('My Trips'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.go('/home/trips'),
          ),
        ),
        const SizedBox(height: AppTheme.paddingMedium),
        Card(
          child: ListTile(
            leading: const Icon(Icons.settings, color: AppTheme.mutedColor),
            title: const Text('Settings'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.go('/home/profile'),
          ),
        ),
      ],
    );
  }

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(authStateNotifierProvider.notifier).signOut();
              context.go('/login');
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
