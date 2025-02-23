# Проверка работы полного 32-битного сумматора в ПЛИС

После того, как вы создали проверили на моделировании 32-разрядный сумматор,
вам необходимо проверить его работу на прототипе в ПЛИС.

Инструкция по реализации прототипа описана [здесь](../../../Vivado%20Basics/How%20to%20program%20an%20fpga%20board.md).




На _рис. 1_ представлена схема прототипа в ПЛИС.

![../../../.pic/Labs/board%20files/nexys_adder_structure.drawio.svg](../../../.pic/Labs/board%20files/nexys_adder_structure.drawio.svg)

_Рисунок 1. Структурная схема модуля `nexys_adder`._

Модуль `nexys_adder` позволяет подавать данные с переключателей <span style="color:#FF6666;">❶</span> на входы `a_i`, `b_i`,
а так же передавать входной бит переноса с помощью кнопки <span style="color:#FF6666;">❷</span> `BTND` на вход `carry_i`.

Переключатели делятся пополам между операндами `a_i`, `b_i` (переключатели `sw[7:0]` относятся к
операнду `b_i`, переключатели `sw[15:8]` относятся к операнду `a_i`). Так как переключателей
всего 16, каждому операнду достается только по 8. Таким образом, с переключателей можно ввести
8 младших бит каждого из операнда.

Старшие биты дополняются нулями, это значит что на нашем прототипе можно складывать числа в
диапазоне `[0:255]` (плюс можно прибавлять входной бит переноса),
а значит диапазон результатов будет `[0:511]`.

Семисегментные индикаторы <span style="color:#FF6666;">❸</span> отображают на левом блоке значение операндов `a_i` и `b_i`
в шестнадцатеричном формате, а на правом — результат сложения. Светодиоды <span style="color:#FF6666;">❹</span>,
расположенные над переключателями, дублируют сумму, представляя ее в двоичном формате.

На _рис. 2_ показан пример сложения `0x48 + 0x18 = 0x60` при нулевом входном переносе.
(нулевом, т.к. не нажата кнопка `BTND`)

![../../../.pic/Labs/board%20files/nexys_adder_48_plus_18.drawio.svg](../../../.pic/Labs/board%20files/nexys_adder_48_plus_18.drawio.svg)

_Рисунок 2. Использование сумматора для вычисления выражения `0x48 + 0x18` в ПЛИС._
