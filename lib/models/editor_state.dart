class EditorState {
  EditorState({
    this.selectedVideoPath,
    this.selectedPhotoPath,
    this.aspectRatio = '9:16',
    this.speed = 1.0,
    this.startTime = 0.0,
    this.endTime = 0.0,
  });

  String? selectedVideoPath;
  String? selectedPhotoPath;
  String aspectRatio;
  double speed;
  double startTime;
  double endTime;
}
