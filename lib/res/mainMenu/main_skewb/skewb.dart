
import 'package:rg2_flutter_getx/models/phases.dart';

class Skewb implements Phase {
  @override
  int count = skewb_title.length;

  @override
  String phase = "SKEWB";

  @override
  List<String> titles() => skewb_title;

  @override
  List<String> icons() => skewb_icon;

  @override
  List<String> descriptions() => skewb_descr;

  @override
  List<String> urls() => skewb_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================


    static const skewb_title = [
        skewb_st1_title,
        skewb_st2_title,
        skewb_st3_title,
        skewb_st4_title,
        skewb_st5_title,
        skewb_st6_title,
    ];

    static const skewb_icon = [
        "skewb_1",
        "skewb_2",
        "skewb_3",
        "skewb_4",
        "skewb_5",
        "skewb_6",
    ];
    
    static const skewb_descr = [
        skewb_st1_descr,
        skewb_st2_descr,
        skewb_st3_descr,
        skewb_st4_descr,
        skewb_st5_descr,
        skewb_st6_descr,
    ];


    static const skewb_url = [
        skewb_st1_url,
        skewb_st2_url,
        skewb_st3_url,
        skewb_st4_url,
        skewb_st5_url,
        skewb_st6_url,
    ];
    
    static const skewb_st1_title = "Этап 1. Сборка первого слоя.";
    static const skewb_st1_descr = """
        <p>Скьюб довольно необычная головоломка. Его название происходит от английских слов
        skew (искривлен) и cube (куб). Внешне эта головолмка напоминает кубик Рубика, а
        по своим  <a href="rg2://ytplay?time=0:14&link=ItI4X9YXCJ8">свойствам</a>
        больше похожа на пирамидку Мефферта. Решается скьюб очень просто,
        всего в <a href="rg2://ytplay?time=2:25&link=ItI4X9YXCJ8">три этапа.</a><br/>
        В данном цикле дополнительно будут рассмотрены еще два ускорения и примеры сборок.</p>

        <p>Сборка начинается с <a href="rg2://ytplay?time=2:37&link=ItI4X9YXCJ8">выбора центра</a> (стороны).
        Например, выберем белый центр. И теперь наша задача поставить уголки вокруг этого центра,
        так чтобы на каждой стороне смежной с белой <a href="rg2://ytplay?time=11:30&link=ItI4X9YXCJ8">были глазки.</a>
        Т.е. собрать первый слой.</p>
        <p style="text-align:center"><img src="skewb_1.xml"></p>

        <p>Для этого:</p>

        <p><b>1.</b> Берем скьюб выбранным <a href="rg2://ytplay?time=3:11&link=ItI4X9YXCJ8">центром сверху.</a></p>
        
        <p style="text-align:center"><img src="skewb_1_1.xml"></p>

        <p><b>2.</b> Теперь наша задача поставить на место первый угол (если он уже там есть, переходим к п.3)</p>
        <p style="text-align:center"><img src="skewb_1_3.xml"></p>

        <p><b>2.1.</b> Для этого ищем какой-нибудь белый уголок на <a href="rg2://ytplay?time=4:25&link=ItI4X9YXCJ8">нижнем слое.</a>
        Если находим - берем скьюб так, чтобы уголок был справа сзади снизу, и одним
        движением ставим его на крышу <a href="rg2://ytplay?time=4:39&link=ItI4X9YXCJ8">на свое место.</a>
        И совершенно неважно, сходится ли он <a href="rg2://ytplay?time=4:53&link=ItI4X9YXCJ8">со своими центрами</a>
        или нет. Переходим к п.3.</p>
        <p style="text-align:center"><img src="skewb_1_2.xml"> => <img src="skewb_1_3.xml"></p>

        <p><b>2.2.</b> Если не находим на нижнем слое, то смотрим, есть ли какой-то уголок на верхнем слое.
        Если он там есть, то будем считать, что он на своем месте,
        <a href="rg2://ytplay?time=7:27&link=ItI4X9YXCJ8">но перевернут.</a>
        А чтобы его повернуть правильно, делаем
        <a href="rg2://ytplay?time=7:39&link=ItI4X9YXCJ8">простой алгоритм:</a></p>

        <p>Опускаем данный уголок <a href="rg2://ytplay?time=7:45&link=ItI4X9YXCJ8">вниз,</a>
        разворачиваем нижний угол, уводя левый <a href="rg2://ytplay?time=7:55&link=ItI4X9YXCJ8">верхний налево,</a>
        поднимаем угол снизу на место, возвращаем уведенный сверху угол на место. На языке формул
        (его можно посмотреть нажав на \"?\" в правом верхнем углу этого окна) это будет выглядеть
        так:</p>
        <p>Алгоритм: <b>R\' D\' R D</b></p>

        <p>Если же угол не встал на свое место, необходимо повторить данный алгоритм
        <a href="rg2://ytplay?time=8:15&link=ItI4X9YXCJ8">еще раз.</a>
        Переходим к п.3.</p>

        <p><b>2.3.</b> Ну и если ни на нижнем ни на верхнем слое белых элементов нет, то значит они все в подвале.
        В этом случае, просто поднимаем любой угол из подвала наверх, а что с ним делать там - см. выше.</p>

        <p><b>3.</b> Установка остальных углов.</p>

        <p>Теперь поставим на свои места остальные 3 угла. Углы ставятся по аналогии с кубиком 2х2. Т.е.
        поставленный уже угол (базовый) берем за основу и ищем другой белый угол на нижнем слое
        (<a href="rg2://ytplay?time=8:40&link=ItI4X9YXCJ8">первом этаже</a>)
        или <a href="rg2://ytplay?time=10:14&link=ItI4X9YXCJ8">в подвале.</a>
        Если одна из наклеек найденного угла совпадает с одной из наклеек базового, то значит его место с той стороны от базового, с которой
        совпадающая наклейка. Если совпадающих наклеек нет, значит его место по диагонали от базового.
        В скьюбе с нижнего слоя любой угол на свое место можно поставить
        <a href="rg2://ytplay?time=8:45&link=ItI4X9YXCJ8">в один ход.</a>
        Но угол может оказаться на своем месте, но при этом быть
        <a href="rg2://ytplay?time=8:56&link=ItI4X9YXCJ8">неверно ориентированным.</a>
        Как его развернуть в таком случае см.п.2.2 (<b>R\' D\' R D</b>)</p>

        <p><b>4.</b>Что делать с углами которые находятся на <a href="rg2://ytplay?time=12:22&link=ItI4X9YXCJ8">верхнем слое или крыше,</a>
        но не на своем месте, я думаю, вы уже и сами догадались. Опустить вниз, а далее по плану п.3.</p>

        <p><b>Алгоритм этапа: R\' D\' R D</b></p>
    """;
    static const skewb_st1_url = "ItI4X9YXCJ8";

    static const skewb_st2_title = "Этап 2. Ориентация остальных углов.";
    static const skewb_st2_descr = """
        <p>На втором этапе наша задача расставить по своим местам и правильно ориентировать
        <a href="rg2://ytplay?time=1:18&link=93Sp66a5Q6o">оставшиеся 4 угла.</a>
        Причем, если мы сделаем все эти 4 угла нужного нам цвета (желтого), то они автоматически
        встанут <a href="rg2://ytplay?time=1:30&link=93Sp66a5Q6o">на свое место.</a></p>

        <p>Первым делом переворачиваем скьюб собранной стороной <a href="rg2://ytplay?time=0:50&link=93Sp66a5Q6o">вниз.</a>
        И смотрим на цвет углов сверху.</p>

        <p>И как это не покажется странным, сначала необходимо сделать так, чтобы жёлтого
        (противоположного ранее собранному) цвета, наверху не было. Т.е.
        <a href="rg2://ytplay?time=6:22&link=93Sp66a5Q6o">вот так:</a></p>
        
        <p style="text-align:center"><img src="skewb_2_1.xml"> => <img src="skewb_2_2.xml"></p>

        <p>Для этого без разницы как взять скьюб, главное белой стороной вниз. И выполнить скьюбовый
        <a href="rg2://ytplay?time=2:00&link=93Sp66a5Q6o">пиф-паф.</a>
        Пиф-паф на скьюбе чем-то похож на пиф-паф на пирамидке. И вот как он
        <a href="rg2://ytplay?time=3:00&link=93Sp66a5Q6o">выполняется:</a></p>
        
        <p>Вращать будем как бы два угла правый верхний и левый верхний. Так же как в пирамидке
        сначала правый угол <a href="rg2://ytplay?time=4:10&link=93Sp66a5Q6o">на себя (F\'),</a>
        потом левый угол <a href="rg2://ytplay?time=5:00&link=93Sp66a5Q6o">на себя (L),</a>
        правый <a href="rg2://ytplay?time=5:20&link=93Sp66a5Q6o">от себя (F),</a> левый
        <a href="rg2://ytplay?time=5:28&link=93Sp66a5Q6o">от себя (L\').</a></p>
        
        <p><a href="rg2://ytplay?time=5:51&link=93Sp66a5Q6o&alg=F\'_L_F_L\'">Алгоритм:</a> <b>F\' L F L\'</b></p>

        <p>Ну и если после выполнения пиф-пафа на верхней стороне еще есть желтые элементы, значит надо
        выполнить пиф-паф <a href="rg2://ytplay?time=6:37&link=93Sp66a5Q6o">еще раз.</a></p>

        <p>Теперь, когда на верхней стороне нет желтых элементов, у скьюба с одной стороны должны быть
        глазки, а с другой ушки. Т.е. если сравнивать с кубиком, то должно получиться что-то
        похожее на ситуацию \"Вертолет\".</p>
        
        <p style="text-align:center"><img src="vaccel_3.xml"></p>

        <p>Делаем перехват таким образом, чтобы скьюб смотрел <a href="rg2://ytplay?time=8:41&link=93Sp66a5Q6o">глазками направо:</a></p>
        
        <p style="text-align:center"><img src="skewb_2_2.xml"></p>

        <p>И выполняем <a href="rg2://ytplay?time=8:45&link=93Sp66a5Q6o">еще один пиф-паф.</a>
        Profit! Все углы должны встать <a href="rg2://ytplay?time=9:10&link=93Sp66a5Q6o">на свои места.</a></p>

    """;
    static const skewb_st2_url = "93Sp66a5Q6o";

    static const skewb_st3_title = "Этап 3. Расстановка центров.";
    static const skewb_st3_descr = """
        <p>На последнем этапе будем расставлять на свои места оставшиеся центры. Скьюб по прежнему
        держим собранной стороной вниз. И ищем центры,
        стоящие не на своих местах. Всего на данном этапе возможны 4 ситуации расположения этих
        центров:</p>

        <b>1. Все <a href="rg2://ytplay?time=0:54&link=gysLJfKILHo">пять центров</a> не на своем месте.</b>
        <p style="text-align:center"><img src="skewb_3_2.xml"></p>

        Если все центры, кроме установленного на первом этапе, не на месте, то смотрим
        на <a href="rg2://ytplay?time=1:32&link=gysLJfKILHo">верхний центр.</a>
        Находим глазки такого же цвета и ставим их <a href="rg2://ytplay?time=1:40&link=gysLJfKILHo">перед собой.</a>
        <p style="text-align:center"><img src="skewb_3_1.xml"></p>

        <p>Делаем <a href="rg2://ytplay?time=2:34&link=gysLJfKILHo">скьюбовый пиф-паф.</a>
        Все уголки верхней грани дожны стать <a href="rg2://ytplay?time=2:53&link=gysLJfKILHo">не желтыми.</a>
        Теперь делаем второй этап. Т.е. разворачиваем скьюб глазками направо (на 180 градусов) и снова
        делаем <a href="rg2://ytplay?time=3:10&link=gysLJfKILHo">пиф-паф.</a>
        Количество центров стоящих <a href="rg2://ytplay?time=3:32&link=gysLJfKILHo">на своих местах</a>
        должно увеличиться. Получаем одну из ситуаций, что описанны ниже.<br/><br/>

        <b>Алгоритм: (F\' L F L\') y2 (F\' L F L\')</b>
        </p>

        <b>2. Три центра (<a href="rg2://ytplay?time=4:05&link=gysLJfKILHo">верхний и два боковых противоположных</a>) не на своем месте.</b>
        <p style="text-align:center"><img src="skewb_3_3.xml"></p>

        <p>Повторяем все то, что делали в первой ситуации.
        Смотрим <a href="rg2://ytplay?time=4:14&link=gysLJfKILHo">на верхний центр,</a>
        поворачиваем скьюб глазками такого же цвета <a href="rg2://ytplay?time=4:35&link=gysLJfKILHo">к себе.</a>
        Делаем <a href="rg2://ytplay?time=5:24&link=gysLJfKILHo">пиф-паф.</a> Разворачиваем скьюб
        <a href="rg2://ytplay?time=5:33&link=gysLJfKILHo">на 180 градусов</a> и делаем ещё один
        <a href="rg2://ytplay?time=5:37&link=gysLJfKILHo">пиф-паф.</a><br/><br/>

        <b>Алгоритм: (F\' L F L\') y2 (F\' L F L\')</b>
        </p>

        <b>3. Три центра (<a href="rg2://ytplay?time=10:52&link=gysLJfKILHo">верхний и два боковых смежных</a>) не на своем месте.</b>
        <p style="text-align:center"><img src="skewb_3_4.xml"></p>

        Как вы заметили, алгоритм из предыдущих ситуаций не меняет расположение углов. И
        те, кто умеют собирать кубик рубика вслепую, скорее всего <a href="rg2://ytplay?time=11:35&link=gysLJfKILHo">догадались,</a>
        как решить эту ситуацию.
        Нужно взять скьюб глазками цвета верхнего центра к себе, а неправильно стоящий сбоку центр
        <a href="rg2://ytplay?time=11:53&link=gysLJfKILHo">установочным ходом</a> (B\' или R),
        в зависимости от того, с какой стороны он стоит, поставить назад.
        <p style="text-align:center"><img src="skewb_3_5.xml"> R => <img src="skewb_3_7.xml"></p>

        <p> Тем самым, по сути, приведя ситуацию к предыдущей.
        <a href="rg2://ytplay?time=12:15&link=gysLJfKILHo">Решаем ее</a> - выполняем пиф-паф,
        разворот на 180 градусов, пиф-паф. И теперь надо не забыть
        <a href="rg2://ytplay?time=12:35&link=gysLJfKILHo">отменить установочный ход</a> (B или R\').<br/><br/>

        <b>Алгоритм: {B\' или R} (F\' L F L\')y2(F\' L F L\') {B или R\'}</b>
        </p>

        <b>4. <a href="rg2://ytplay?time=14:38&link=gysLJfKILHo">Четыре центра</a> не на местах.</b>
        <p>Ситуация, когда не обязательно держать скьюб собранной стороной вниз. Его
        нужно поставить так, чтобы центры стоящие на своих местах были снизу, справа или слева. А
        к себе глазками верхней стороны. Т.е, если стоящие верно центры находятся друг напротив друга,
        то надо расположить их <a href="rg2://ytplay?time=15:10&link=gysLJfKILHo">справа и слева.</a>
        А если они смежны, то один снизу, а другой справа или слева.
        Главное глазками верхней стороны к себе.<br/><br/>

        И снова выполняем алгоритм из второй ситуации, получаем одну из предыдущих ситуаций.
        Как их решать уже знаем.</p>

    """;
    static const skewb_st3_url = "gysLJfKILHo";

    static const skewb_st4_title = "Ускорение 1. Быстрый пиф-паф.";
    static const skewb_st4_descr = """
        <p>Просто <a href="rg2://ytplay?time=2:51&link=a5o-pUzGqwg">фингертрикс пиф-пафа</a> от Максима.</p>
    """;
    static const skewb_st4_url = "a5o-pUzGqwg";

    static const skewb_st5_title = "Ускорение 2. Три пиф-пафа.";
    static const skewb_st5_descr = """
        <p>Если на скьюбе выполнить три пиф-пафа без перехватов, то между собой поменяются верхний и
        передний, а также левый и правый центры. Т.е. получится один из вариантов четвертой
        ситуации третьего этапа, когда не на месте <a href="rg2://ytplay?time=0:37&link=79IjFrvr774">4 центра.</a>
        Решается данная ситуация так же в три пиф-пафа без перехватов.</p>
    """;
    static const skewb_st5_url = "79IjFrvr774";

    static const skewb_st6_title = "Примеры сборок";
    static const skewb_st6_descr = """
        <p>Просто примеры сборок. Смотрите видео.</p>
    """;
    static const skewb_st6_url = "WFK69SoXcak";


}
