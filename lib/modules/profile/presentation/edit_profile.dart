import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/modules/profile/data/user_model.dart';
import 'package:todolist/modules/profile/presentation/bloc/update_profile_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel? userModel;

  const EditProfileScreen({
    super.key,
    required this.userModel,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _fullnameController = TextEditingController();

  late UpdateProfileBloc _updateProfileBloc;

  @override
  void initState() {
    _updateProfileBloc = UpdateProfileBloc();
    _updateProfileBloc.add(UpdateProfileInitEvent(userModel: widget.userModel));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _updateProfileBloc,
      child: BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
        bloc: _updateProfileBloc,
        listener: (context, state) {
          if (state.isSaveSuccess) {
            final userModel = state.userModel;
            Navigator.pop(context, userModel);
          }
        },
        builder: (context, state) {
          final userModel = state.userModel;
          _usernameController.text = userModel?.username ?? "";
          _emailController.text = userModel?.email ?? "";
          _phoneController.text = userModel?.phone ?? "";
          _fullnameController.text = userModel?.fullname ?? "";

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Edit Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.blueAccent,
              actions: [
                IconButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _updateProfileBloc.add(
                        UpdateProfileSaveEvent(
                          userModel: userModel!.copyWith(
                            username: _usernameController.text,
                            email: _emailController.text,
                            phone: _phoneController.text,
                            fullname: _fullnameController.text,
                            gender: state.genderSelected,
                          ),
                        ),
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                children: [
                  bodyWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget get bodyWidget {
    final maxWidth = MediaQuery.of(context).size.width;
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
                const SizedBox(height: 48),
                const Text(
                  "Nguyen Van A",
                  style: TextStyle(
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
                formEditWidget,
                const SizedBox(height: 24),
                genderRadioList,
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

  Widget get formEditWidget {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
            ),
          ),
          TextFormField(
            controller: _fullnameController,
            decoration: const InputDecoration(
              labelText: 'Fullname',
            ),
          ),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: 'Mobile Phone',
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
        ],
      ),
    );
  }

  Widget get genderRadioList {
    final genderSelected = _updateProfileBloc.state.genderSelected;
    final genderType = GenderExtension.getGenderType(genderSelected);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Gender",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 120,
              child: RadioListTile<GenderType>(
                title: const Text("Male"),
                contentPadding: EdgeInsets.zero,
                value: GenderType.male,
                groupValue: genderType,
                onChanged: (GenderType? value) {
                  _updateProfileBloc
                      .add(UpdateProfileChangeGender(genderType: value));
                },
              ),
            ),
            SizedBox(
              width: 120,
              child: RadioListTile<GenderType>(
                title: const Text("Female"),
                contentPadding: EdgeInsets.zero,
                value: GenderType.female,
                groupValue: genderType,
                onChanged: (GenderType? value) {
                  _updateProfileBloc
                      .add(UpdateProfileChangeGender(genderType: value));
                },
              ),
            ),
            SizedBox(
              width: 120,
              child: RadioListTile<GenderType>(
                title: const Text("Other"),
                contentPadding: EdgeInsets.zero,
                value: GenderType.other,
                groupValue: genderType,
                onChanged: (GenderType? value) {
                  _updateProfileBloc
                      .add(UpdateProfileChangeGender(genderType: value));
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

enum GenderType {
  male,
  female,
  other;
}

extension GenderExtension on GenderType {
  static GenderType getGenderType(String gender) {
    if (gender == "male") return GenderType.male;
    if (gender == "female") return GenderType.female;
    if (gender == "other") return GenderType.other;
    return GenderType.male;
  }
}
