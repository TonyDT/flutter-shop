import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myapp/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  const HmSlider({super.key,required this.bannerList});

  @override
  State<HmSlider> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  //控制轮播图跳转的控制器
  CarouselSliderController _controller =CarouselSliderController();
  int _currentIndex=0;
  //banner
  Widget _getSlider(){
    final double screenWidth = MediaQuery.of(context).size.width;//屏幕宽度
    //发你轮播图插件
    return CarouselSlider(
      carouselController: _controller,
        items: List.generate(widget.bannerList.length, (int index){
           return Image.network(widget.bannerList[index].imgUrl,fit: BoxFit.cover,width: screenWidth,);
    }), options: CarouselOptions(
      viewportFraction: 1,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      onPageChanged: (int index,reason){
        _currentIndex = index;
        setState(() {

        });
      }
    ));
  }
  //搜索栏
  Widget _getSearch(){
    return Positioned(
      left: 0,
      right: 0,
      top: MediaQuery.of(context).padding.top,
      child: Padding(padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text("搜索..",
            style: TextStyle(color: Colors.white,fontSize: 16),),
        ),
      ),

    );
  }
  //导航部件
  Widget _getDots(){
    return Positioned(
      left: 0,right: 0,bottom: 10,
        child: SizedBox(
          height:40,width: double.infinity,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.bannerList.length, (int index){
                    return GestureDetector(
                      onTap: (){
                        _controller.jumpToPage(index);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 4,
                        width: index == _currentIndex ? 40 :20,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                            color:index==_currentIndex? Colors.white:Color.fromRGBO(0, 0, 0, 0.6),
                            borderRadius: BorderRadius.circular(3)
                        ),
                      ),
                    );
                  })
          ),
        )
    );

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_getSlider(),_getSearch(),_getDots()],
    );

    // statk->轮播图 搜索框  指示灯
    // return Container(
    //   height: 300,
    //   color: Colors.blue,
    //   alignment: Alignment.center,
    //     child:Text("轮播图",style: TextStyle(color: Colors.white,fontSize: 20),),
    //
    // );
  }
}
