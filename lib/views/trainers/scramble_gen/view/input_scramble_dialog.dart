import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/views/shared/buttons_style.dart';
import 'package:rg2/views/trainers/scramble_gen/controller/trainers_scramble_gen_controller.dart';

class InputScrambleDialog extends StatelessWidget {
  final ScrambleGenController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                  child: Text(_controller.inputScramble,
                    maxLines: 3,
                    style: Get.textTheme.headline4.copyWith(color: Theme.of(context).accentColor),
                  )
              ),
              Row( children: [
                  OneButton(controller: _controller, letter: "L"),
                  OneButton(controller: _controller, letter: "R"),
                  OneButton(controller: _controller, letter: "'"),
                ]),
              Row( children: [
                  OneButton(controller: _controller, letter: "D"),
                  OneButton(controller: _controller, letter: "U"),
                  OneButton(controller: _controller, letter: "2"),
                ]),
              Row( children: [
                  OneButton(controller: _controller, letter: "B"),
                  OneButton(controller: _controller, letter: "F"),
                  OneButton(controller: _controller, letter: "W"),
                ]),
              Row( children: [
                OneButton(controller: _controller, letter: "M"),
                OneButton(controller: _controller, letter: "S"),
                OneButton(controller: _controller, letter: "E"),
              ]),
              Row( children: [
                OneButton(controller: _controller, letter: "x"),
                OneButton(controller: _controller, letter: "y"),
                OneButton(controller: _controller, letter: "z"),
              ]),
              Center(
                child: Row( children: [
                    Expanded(child: DoubleButton(controller: _controller, letter: "DEL")),
                  ]),
              ),
            ],
          ),
        );
      },
    );
  }
}

class OneButton extends StatelessWidget {
  const OneButton({
    Key key,
    @required ScrambleGenController controller,
    @required this.letter,
  }) : _controller = controller, super(key: key);

  final ScrambleGenController _controller;
  final String letter;

  @override
  Widget build(BuildContext context) {
    var modifier = (letter == "'" || letter == "2" || letter == "W" ) ? true : false;
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
        child: ElevatedButton(
          style: modifier ? raisedAccentButtonStyle : raisedButtonStyle,
          onPressed: () {
            _controller.inputLetter(letter);
          },
          child: Text(letter),
        ),
      ),
    );
  }
}

class DoubleButton extends StatelessWidget {
  const DoubleButton({
    Key key,
    @required ScrambleGenController controller,
    @required this.letter,
  }) : _controller = controller, super(key: key);

  final ScrambleGenController _controller;
  final String letter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            minWidth: 200,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              _controller.inputLetter(letter);
            },
            child: Text(letter)
        ),
      ),
    );
  }
}