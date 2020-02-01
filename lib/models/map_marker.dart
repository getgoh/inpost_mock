class CustomMapMarker {
  final String markerType;
  final String markerId;
  final double lat;
  final double lng;
  final String title;
  final String snippet;
  final Function onTap;

  CustomMapMarker({
    this.markerId,
    this.lat,
    this.lng,
    this.title,
    this.snippet,
    this.onTap,
    this.markerType,
  });
}
