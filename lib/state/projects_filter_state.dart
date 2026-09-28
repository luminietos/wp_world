// RETAINS FILTERS WHEN NAVIGATING AWAY

import 'package:wp_world/models/project.dart';
import 'package:shared_preferences/shared_preferences.dart'; // persistence

// GLOBAL FILTER STATE (persists across navigation)
class ProjectsFilterState {
  static final ProjectsFilterState _instance = ProjectsFilterState._internal();
  factory ProjectsFilterState() => _instance;
  ProjectsFilterState._internal();

  // PERSISTENT FILTER SETS
  final Set<String> selectedTech = {};
  final Set<String> selectedProjectTypes = {};
  final Set<bool> selectedStatuses = {};
  final Set<String> selectedCategories = {};
  final Set<String> selectedRoles = {};

  void reset() {
    selectedTech.clear();
    selectedProjectTypes.clear();
    selectedStatuses.clear();
    selectedCategories.clear();
    selectedRoles.clear();
  }

  bool matches(Project p) {
    if (selectedTech.isNotEmpty &&
        !selectedTech.any((t) => p.techStack.contains(t))) {
      return false;
    }

    if (selectedProjectTypes.isNotEmpty &&
        !selectedProjectTypes.contains(p.projectType)) {
      return false;
    }

    if (selectedStatuses.isNotEmpty &&
        !selectedStatuses.contains(p.isOngoing)) {
      return false;
    }

    if (selectedCategories.isNotEmpty &&
        !selectedCategories.any((c) => p.categories.contains(c))) {
      return false;
    }

    if (selectedRoles.isNotEmpty &&
        !selectedRoles.any((r) => p.rolesStack.contains(r))) {
      return false;
    }

    return true;
  }

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setStringList('filter_tech', selectedTech.toList());
    prefs.setStringList('filter_types', selectedProjectTypes.toList());
    prefs.setStringList('filter_categories', selectedCategories.toList());
    prefs.setStringList('filter_roles', selectedRoles.toList());

    prefs.setStringList(
      'filter_statuses',
      selectedStatuses.map((s) => s.toString()).toList(),
    );
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    selectedTech
      ..clear()
      ..addAll(prefs.getStringList('filter_tech') ?? []);

    selectedProjectTypes
      ..clear()
      ..addAll(prefs.getStringList('filter_types') ?? []);

    selectedCategories
      ..clear()
      ..addAll(prefs.getStringList('filter_categories') ?? []);

    selectedRoles
      ..clear()
      ..addAll(prefs.getStringList('filter_roles') ?? []);

    selectedStatuses
      ..clear()
      ..addAll(
        (prefs.getStringList('filter_statuses') ?? []).map((s) => s == 'true'),
      );
  }
}
