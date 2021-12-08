import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwr_app/bloc/index.dart';
import 'package:hwr_app/model/psycho.dart';
import 'package:hwr_app/routes/route_names.dart';
import 'package:hwr_app/screens/success/index.dart';
import 'package:hwr_app/widgets/button/main_button.dart';
import 'package:hwr_app/widgets/container/main_container.dart';
import 'package:easy_localization/easy_localization.dart';

class LoadingPage extends StatefulWidget {
  final File file;

  const LoadingPage({required this.file});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final List<String> _facts = [
    "Бидний унтахын өмнө боддог зүйлсийн 90% нь бидэнд тохиолдоосой гэсэн зүйлс байдаг.",
    "Бүх л өдөржин орондоо хэвтэхийг CLINOMANIA гэдэг.",
    "Зомби шүтэн бишрэгчдийг ЗОМБОФИЛЕС гэдэг.",
    "Хүнд өдөрт дунджаар 8 тэврэлт хэрэгтэй байдаг.",
    "Хүний тархи 10 ваттын гэрлийн чийдэн асаахтай ижил хэмжээний энерги ашигладаг.",
    "Бид амьдралынхаа 13%-г төсөөлж өнгөрөөдөг.",
    "Баруун талд байгаа зүйлсээс айх айдсыг \"DEXTROPHOBIA\" гэдэг.",
    "Хүнд жинтэй хөнжил нөмөрч унтах нь нойргүйдэл болон сэтгэл зовнилыг бууруулахад тусалдаг.",
    "Бидний бодол бүх л хугацааныхаа 70%-г дурсамж бодоход зарцуулдаг.",
    "Муурны тархи IPAD-аас 1000 дахин илүү өгөгдөл хадгалах чадвартай.",
    "Урт хугацааны стресс сэтгэх, суралцах чадварыг 6 дахин багасгадаг.",
  ];
  final List<String> _urls = [
    "assets/facts/1.jpg",
    "assets/facts/2.jpg",
    "assets/facts/3.jpg",
    "assets/facts/4.jpg",
    "assets/facts/5.jpg",
    "assets/facts/6.jpg",
    "assets/facts/7.jpg",
    "assets/facts/8.jpg",
    "assets/facts/9.jpg",
    "assets/facts/10.jpg",
    "assets/facts/11.jpg",
  ];
  Timer? _timer;
  final _bloc = CommonBloc(CommonInitial());
  PsychoModel? _data;
  int _imageIdx = 1;
  String _loader = ".";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      _bloc.add(CommonRequest(file: widget.file));
    });
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        if (_loader == "...")
          _loader = ".";
        else
          _loader = _loader + ".";
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  _onFailed(String err) {
    print(err);
    setState(() {
      _isLoading = false;
    });
  }

  _onSuccess(PsychoModel data) {
    setState(() {
      _data = data;
      _isLoading = false;
    });
  }

  _onNext() {
    if (_data != null)
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => SuccessPage(_data!)),
        ModalRoute.withName(RouteName.HOME),
      );
    else
      Navigator.pushNamedAndRemoveUntil(context, RouteName.ERROR, ModalRoute.withName(RouteName.HOME));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MultiBlocListener(
      child: BlocBuilder<CommonBloc, CommonState>(
        bloc: _bloc,
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: MainContainerBackground(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).chipTheme.backgroundColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                              child: Image.asset(_urls[_imageIdx]),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                              child: Text(
                                _facts[_imageIdx],
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18,
                                  height: 25 / 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _isLoading
                          ? Text(
                              "loading".tr() + _loader,
                              style: TextStyle(
                                color: Theme.of(context).errorColor,
                                fontFamily: "Pacifico",
                                fontSize: 24,
                              ),
                            )
                          : MainButton(title: "Үр дүн харах", onPress: _onNext),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      listeners: [
        BlocListener<CommonBloc, CommonState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is CommonFailure) _onFailed(state.error);
            if (state is CommonSuccessful) _onSuccess(state.data);
          },
        )
      ],
    );
  }
}
