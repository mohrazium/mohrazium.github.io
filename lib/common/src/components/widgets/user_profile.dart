part of common.components;

class UserProfileData {
  final ImageProvider image;
  final String name;
  final String userRoll;

  const UserProfileData({
    required this.image,
    required this.name,
    required this.userRoll,
  });
}

class UserProfile extends StatelessWidget {
  const UserProfile({
    required this.data,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final UserProfileData data;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(kBorderRadius),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              _buildImage(),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildName(),
                    _buildRoll(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return CircleAvatar(
      radius: 25,
      backgroundImage: data.image,
    );
  }

  Widget _buildName() {
    return Text(
      data.name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildRoll() {
    return Text(
      data.userRoll,
      style: const TextStyle(
        fontWeight: FontWeight.w300,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
