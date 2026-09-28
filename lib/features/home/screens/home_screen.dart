import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shree_video_creator/app/routes.dart';
import 'package:shree_video_creator/app/theme.dart';
import 'package:shree_video_creator/core/constants/constants.dart';
import 'package:shree_video_creator/core/widgets/primary_button.dart';
import 'package:shree_video_creator/features/editor/controllers/editor_controller.dart';
import 'package:shree_video_creator/features/projects/controllers/projects_controller.dart';
import 'package:shree_video_creator/models/video_project.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<NavigationDestination> destinations = [
    NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
    NavigationDestination(icon: Icon(Icons.folder_rounded), label: 'Projects'),
    NavigationDestination(icon: Icon(Icons.grid_view_rounded), label: 'Templates'),
    NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    final projectsController = context.watch<ProjectsController>();
    final projects = projectsController.projects;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.primary, AppColors.accent],
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create amazing videos',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Edit • Create • Share',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 18),
                    PrimaryButton(
                      label: '+ New Project',
                      onPressed: () => Navigator.pushNamed(context, AppRoutes.mediaPicker),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text('Quick Tools', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
                children: const [
                  QuickToolButton(icon: Icons.cut_rounded, label: 'Trim'),
                  QuickToolButton(icon: Icons.music_note_rounded, label: 'Music'),
                  QuickToolButton(icon: Icons.text_fields_rounded, label: 'Text'),
                  QuickToolButton(icon: Icons.image_rounded, label: 'Photo'),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Recent Projects', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              if (projects.isEmpty)
                const Expanded(
                  child: Center(
                    child: Text(
                      'Your recent projects will appear here.',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      final project = projects[index];
                      return _ProjectItemCard(project: project);
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.pushNamed(context, AppRoutes.projects);
              break;
            case 2:
              Navigator.pushNamed(context, AppRoutes.templates);
              break;
            case 3:
              Navigator.pushNamed(context, AppRoutes.settings);
              break;
          }
        },
        destinations: destinations,
      ),
    );
  }
}

class QuickToolButton extends StatelessWidget {
  const QuickToolButton({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$label tool selected')),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 26, color: AppColors.primary),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectItemCard extends StatelessWidget {
  const _ProjectItemCard({required this.project});

  final VideoProject project;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColors.primarySoft,
            ),
            child: const Icon(Icons.movie_creation_rounded, color: AppColors.primary, size: 34),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(project.name, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(project.duration ?? '00:40', style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 4),
                Text(
                  project.lastEditedAt != null
                      ? 'Last edited: ${project.lastEditedAt!.toLocal().toString().split(' ')[0]}'
                      : 'Recently edited',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.editor),
            icon: const Icon(Icons.open_in_new_rounded),
          ),
        ],
      ),
    );
  }
}
