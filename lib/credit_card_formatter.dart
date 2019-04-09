import 'package:flutter/material.dart';

class TradeMarkWidget extends StatelessWidget {
  static const String VISA = "VISA";
  static const String MASTERCARD = "MASTERCARD";
  final String tradeMark;

  const TradeMarkWidget({Key key, this.tradeMark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var visaLogoAsset = new AssetImage('images/visa_pos_fc.png');
    var mcLogoAsset = new AssetImage('images/mc_pos_fc.png');
    var tradeMarkLogo;
    if (tradeMark == VISA) {
      tradeMarkLogo =
          new Image(image: visaLogoAsset, width: 50.0, height: 50.0);
    } else {
      tradeMarkLogo = new Image(image: mcLogoAsset, width: 50.0, height: 50.0);
    }

    return new Container(child: tradeMarkLogo);
  }
}

class CreditCard extends StatefulWidget {
  final double cardWidth;
  final String tradeMark;
  final String fullName;
  final String pan;
  final String expiration;

  CreditCard(
      {this.cardWidth,
      this.tradeMark,
      this.fullName,
      this.pan,
      this.expiration});

  @override
  State<StatefulWidget> createState() {
    return _CreditCardState();
  }
}

class _CreditCardState extends State<CreditCard> {
  
  @override
  Widget build(BuildContext context) {
    
    var cardHeight = widget.cardWidth / 1.6;

    var chipWidth = widget.cardWidth * 0.15;
    var chipHeight = chipWidth / 1.35;

    var pvTrademark = cardHeight * 0.75; //vertical position
    var phTrademark = widget.cardWidth * 0.8; //horizontal position

    var pvFullname = cardHeight * 0.84;
    var phFullname = widget.cardWidth * 0.06;
    var fsFullname = cardHeight * 0.075;

    var pvPan = cardHeight * 0.63;
    var phPan = widget.cardWidth * 0.06;
    var fsPan = cardHeight * 0.055;

    var pvExpiration = cardHeight * 0.73;
    var phExpiration = widget.cardWidth * 0.50;
    var fsExpiration = cardHeight * 0.06;

    var pvGoodThru = cardHeight * 0.73;
    var phGoodThru = widget.cardWidth * 0.40;
    var fsGoodThru = cardHeight * 0.033;

    var pvIssuer = cardHeight * -0.1;
    var phIssuer = widget.cardWidth * 0.03;

    var pvChip = cardHeight * 0.35;
    var phChip = widget.cardWidth * 0.06;

    return Container(
      width: widget.cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
          borderRadius: BorderRadius.circular(15.0)),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: pvPan,
            left: phPan,
            child: Text(
              widget.pan,
              textScaleFactor: 1.0,
              overflow: TextOverflow.clip,
              style: TextStyle(
                  fontFamily: 'CreditCard',
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(-1.0, -1.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 150, 150, 150),
                    ),
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 70, 70, 70),
                    ),
                  ],
                  decoration: TextDecoration.none,
                  fontSize: fsPan,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: pvTrademark,
            left: phTrademark,
            child: new TradeMarkWidget(tradeMark: widget.tradeMark),
          ),
          Positioned(
            top: pvFullname,
            left: phFullname,
            child: Text(
              widget.fullName,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: fsFullname,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: pvExpiration,
            left: phExpiration,
            child: Text(
              widget.expiration,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: fsExpiration,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: pvGoodThru,
            left: phGoodThru,
            child: Text(
              "GOOD\nTHRU",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: fsGoodThru,
                  color: Colors.white),
            ),
          ),
          Positioned(
              top: pvIssuer,
              left: phIssuer,
              child: new Image(
                image: new AssetImage('images/issuer_logo.png'),
                width: 100.0,
                height: 80.0,
              )),
          Positioned(
            top: pvChip,
            left: phChip,
            child: Container(
                width: chipWidth,
                height: chipHeight,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [
                          0.3,
                          0.6,
                          0.9
                        ],
                        colors: [
                          // Colors are easy thanks to Flutter's Colors class.
                          Colors.grey[300],
                          Colors.grey[400],
                          Colors.grey[500],
                        ]),
                    borderRadius: BorderRadius.circular(5.0))),
          )
        ],
      ),
    );
  }
}
