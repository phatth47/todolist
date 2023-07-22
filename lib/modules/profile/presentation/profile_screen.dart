import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/components/icon_title_widget.dart';
import 'package:todolist/components/info_item_widget.dart';
import 'package:todolist/modules/profile/presentation/bloc/profile_bloc.dart';
import 'package:todolist/modules/profile/presentation/edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  final String title;

  const ProfileScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileBloc _profileBloc;

  @override
  void initState() {
    _profileBloc = ProfileBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _profileBloc..add(const ProfileFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.isFetching) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                children: [
                  bodyWidget,
                  IconTitleWidget(
                    icon: Icons.file_copy_rounded,
                    title: "Contract",
                    onPressed: () {},
                  ),
                  const SizedBox(height: 12),
                  IconTitleWidget(
                    icon: Icons.key,
                    title: "Change Password",
                    onPressed: () {},
                  ),
                  const SizedBox(height: 12),
                  IconTitleWidget(
                    icon: Icons.logout,
                    title: "Logout",
                    onPressed: () {},
                    color: Colors.blue,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget get bodyWidget {
    final maxWidth = MediaQuery.of(context).size.width;
    final state = _profileBloc.state;
    final fullname = state.userModel?.fullname ?? "";
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.all(8),
            width: maxWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: editButton,
                ),
                Text(
                  fullname,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Sales Manager",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                infoListWidget,
              ],
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ],
      ),
    );
  }

  Widget get infoListWidget {
    final state = _profileBloc.state;
    final infoList = <InforItemModel>[
      InforItemModel(
        title: "Name",
        value: state.userModel?.username ?? "",
      ),
      InforItemModel(
        title: "Phone",
        value: state.userModel?.phone ?? "",
      ),
      InforItemModel(
        title: "Email",
        value: state.userModel?.email ?? "",
      ),
      // InforItemModel(
      //   title: "DOB",
      //   value: "01/01/1000",
      // ),
      InforItemModel(
        title: "Gender",
        value: state.userModel?.gender ?? "",
      ),
      // InforItemModel(
      //   title: "Address",
      //   value: "1 Nguyen Van A, P.1, Q.1, TP.HCM",
      // ),
    ];
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final model = infoList[index];
        return InfoItemWidget(model: model);
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 1,
          color: Colors.grey,
        );
      },
      itemCount: infoList.length,
    );
  }

  Widget get editButton {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.blue),
      ),
      child: IconButton(
        iconSize: 20,
        icon: const Icon(
          Icons.edit,
          color: Colors.blue,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditProfileScreen(
                  userModel: _profileBloc.state.userModel,
                );
              },
            ),
          ).then((userModel) {
            if (userModel != null) {
              _profileBloc.add(ProfileUpdateEvent(userModel: userModel));
            }
          });
        },
      ),
    );
  }
}
