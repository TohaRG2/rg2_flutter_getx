import 'package:rg2/models/phases.dart';
import 'package:rg2/res/azbuka/basic_3x3.dart';
import 'package:rg2/res/azbuka/basic_4x4.dart';
import 'package:rg2/res/azbuka/basic_5x5.dart';
import 'package:rg2/res/azbuka/basic_clover.dart';
import 'package:rg2/res/azbuka/basic_container.dart';
import 'package:rg2/res/azbuka/basic_ivy.dart';
import 'package:rg2/res/azbuka/basic_pyraminx.dart';
import 'package:rg2/res/azbuka/basic_pyraminx_4x4.dart';
import 'package:rg2/res/azbuka/basic_redi.dart';
import 'package:rg2/res/azbuka/basic_skewb.dart';
import 'package:rg2/res/azbuka/basic_square.dart';
import 'package:rg2/res/mainMenu/main2x2/advanced2x2.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/accel.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/cross.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/f2l/adv_f2l.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/main_f2l.dart';
import 'package:rg2/res/mainMenu/main_2x2.dart';
import 'package:rg2/res/mainMenu/main_3x3.dart';
import 'package:rg2/res/mainMenu/main_big.dart';
import 'package:rg2/res/mainMenu/main_other.dart';
import 'package:rg2/res/mainMenu/main_other/main_pyraminx.dart';
import 'package:rg2/res/mainMenu/main_other3x3.dart';
import 'package:rg2/res/mainMenu/main_other3x3/axis.dart';
import 'package:rg2/res/mainMenu/main_skewb.dart';
import 'package:rg2/res/mainMenu/main2x2/begin2x2.dart';
import 'package:rg2/res/mainMenu/main2x2/cll.dart';
import 'package:rg2/res/mainMenu/main2x2/ortega.dart';
import 'package:rg2/res/mainMenu/main3x3/blind.dart';
import 'package:rg2/res/mainMenu/main3x3/chechnev.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/coll.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/f2l/f2l.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/f2l/int_f2l.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/oll.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/pll.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/roux.dart';
import 'package:rg2/res/mainMenu/main3x3/patterns.dart';
import 'package:rg2/res/mainMenu/main3x3/rozov.dart';
import 'package:rg2/res/mainMenu/main_big/begin_4x4.dart';
import 'package:rg2/res/mainMenu/main_big/begin_5x5.dart';
import 'package:rg2/res/mainMenu/main_big/big_cubes.dart';
import 'package:rg2/res/mainMenu/main_big/blind_4x4.dart';
import 'package:rg2/res/mainMenu/main_big/yau_4x4.dart';
import 'package:rg2/res/mainMenu/main_other/cuboid2x2x3.dart';
import 'package:rg2/res/mainMenu/main_other/main_pyraminx/keyhole.dart';
import 'package:rg2/res/mainMenu/main_other/main_pyraminx/pyraminx.dart';
import 'package:rg2/res/mainMenu/main_other/main_pyraminx/pyraminx_4x4.dart';
import 'package:rg2/res/mainMenu/main_other/megaminx.dart';
import 'package:rg2/res/mainMenu/main_other/pentacle.dart';
import 'package:rg2/res/mainMenu/main_other/square.dart';
import 'package:rg2/res/mainMenu/main_other/square_star.dart';
import 'package:rg2/res/mainMenu/main_other3x3/brick_cube.dart';
import 'package:rg2/res/mainMenu/main_other3x3/cuboid3x3x2.dart';
import 'package:rg2/res/mainMenu/main_other3x3/cylinder.dart';
import 'package:rg2/res/mainMenu/main_other3x3/fisher.dart';
import 'package:rg2/res/mainMenu/main_other3x3/gear.dart';
import 'package:rg2/res/mainMenu/main_other3x3/ghost.dart';
import 'package:rg2/res/mainMenu/main_other3x3/mirror.dart';
import 'package:rg2/res/mainMenu/main_other3x3/penrose.dart';
import 'package:rg2/res/mainMenu/main_other3x3/prisma.dart';
import 'package:rg2/res/mainMenu/main_other3x3/pyramorphix.dart';
import 'package:rg2/res/mainMenu/main_other3x3/sudoku.dart';
import 'package:rg2/res/mainMenu/main_other3x3/twistyCube.dart';
import 'package:rg2/res/mainMenu/main_other3x3/windmill.dart';
import 'package:rg2/res/mainMenu/main_skewb/clover.dart';
import 'package:rg2/res/mainMenu/main_skewb/container.dart';
import 'package:rg2/res/mainMenu/main_skewb/ivy.dart';
import 'package:rg2/res/mainMenu/main_skewb/redi_cube.dart';
import 'package:rg2/res/mainMenu/main_skewb/skewb.dart';
import 'package:rg2/res/mainMenu/main_skewb/twisty_skewb.dart';
import 'package:rg2/views/trainers/scramble_gen/model/moves.dart';

/// Список фаз для инициализации базы
var phasesToInit = <Phase>[
  //--- Основные пункты меню
  BigMain(), Cross(), G2f(), Main2x2(), Main3x3(), MainF2l(),
  MainOther(), MainOther3x3(), MainPyraminx(), MainSkewb(),
  //--- сами головоломки
  Accel(), AdvF2L(), Advanced2x2(), Axis(),
  Begin(), Begin2x2(), Begin4x4(), Begin5x5(), BigCubes(), Blind(), Blind4x4(), BrickCube(),
  Clover(), Cll(), Coll(), ContainerCube(), Cuboid2x2x3(), Cuboid3x3x2(), Cylinder(), F2l(), Fisher(),
  Gear(), Ghost(), IntF2l(), Ivy(), Keyhole(), Megaminx(), Mirror(), Oll(), Ortega(),
  Patterns(), Pentacle(), Penrose(), Pll(), Prisma(), Pyramorphix(), Pyraminx(), Pyraminx4x4(),
  RediCube(), Rozov(), Roux(), Skewb(), Square(), SquareStar(), Sudoku(),
  TwistyCube(), TwistySkewb(), Windmill(), Yau4x4()
];

/// Список фаз с основными движениями головоломок
var movesToInit = <Moves> [
  Basic3x3(), Basic4x4(), Basic5x5(), BasicClover(), BasicContainer(), BasicIvy(),
  BasicPyraminx(), BasicPyraminx4x4(), BasicRedi(), BasicSkewb(), BasicSquare(),
];