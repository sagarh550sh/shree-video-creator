abstract class ExportService {
  Future<String?> export({
    required String inputPath,
    required String outputPath,
    required Duration start,
    required Duration end,
    String? musicPath,
    String? overlayText,
    String aspectRatio = '9:16',
    int width = 1080,
    int height = 1920,
  });
}

class PlaceholderExportService implements ExportService {
  @override
  Future<String?> export({
    required String inputPath,
    required String outputPath,
    required Duration start,
    required Duration end,
    String? musicPath,
    String? overlayText,
    String aspectRatio = '9:16',
    int width = 1080,
    int height = 1920,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    return null;
  }
}
