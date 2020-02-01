final List<PageData> onboardingData = [
  PageData(
    mainText: 'Welcome to InPost',
    subText: 'From now on, all your parcels\nare within reach.',
    img: 'images/welcome.jpg',
  ),
  PageData(
    mainText: 'Parcel Tracking',
    subText: 'Now you can easily\nobserve it\'s journey.',
    img: 'images/parcel.jpg',
  ),
  PageData(
    mainText: 'Quick Returns',
    subText: 'No more wasting time on returns.\nJust click, and it\'s done!',
    img: 'images/returns.jpg',
  ),
  PageData(
    mainText: 'Map',
    subText:
        'With intuitive map you can easily\nfind your nearest packing machine.',
    img: 'images/map.jpg',
  ),
];

class PageData {
  final String mainText;
  final String subText;
  final String img;

  PageData({this.img, this.mainText, this.subText});
}
