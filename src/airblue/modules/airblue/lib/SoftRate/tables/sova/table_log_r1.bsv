// total ber: 0.004892
// a = 0.364000 b = 0.000000
// generated by compute-ber.py
// table for rate 1 (curve fit)
// (computed without odd hints)

import Real::*;

function data_t get_ber_r1_log(Bit#(8) hint)
      provisos (RealLiteral#(data_t), Arith#(data_t));
   case (hint) matches
       0: return -1.000000000000000;
       1: return -1.286333655948310;
       2: return -1.618677785473514;
       3: return -1.992851283027206;
       4: return -2.402932261386713;
       5: return -2.842347014187006;
       6: return -3.304768360123497;
       7: return -3.784662604940144;
       8: return -4.277504926963651;
       9: return -4.779768300616386;
      10: return -5.288795465965642;
      11: return -5.802632163848661;
      12: return -6.319865414107243;
      13: return -6.839485750289101;
      14: return -7.360778009562535;
      15: return -7.883238492773868;
      16: return -8.406513886503738;
      17: return -8.930357069442607;
      18: return -9.454595538232534;
      19: return -9.979109043028625;
      20: return -10.503813839800689;
      21: return -11.028651646774366;
      22: return -11.553581921521419;
      23: return -12.078576470710960;
      24: return -12.603615693016520;
      25: return -13.128685962803718;
      26: return -13.653777809398752;
      27: return -14.178884650583374;
      28: return -14.704001911886138;
      29: return -15.229126414283463;
      30: return -15.754255948572542;
      31: return -16.279388979536300;
      32: return -16.804524440336234;
      33: return -17.329661589621320;
      34: return -17.854799912226330;
      35: return -18.379939050164147;
      36: return -18.905078754671059;
      37: return -19.430218852882579;
      38: return -19.955359224676311;
      39: return -20.480499786580086;
      40: return -21.005640480589733;
      41: return -21.530781266398634;
      42: return -22.055922115998040;
      43: return -22.581063009924922;
      44: return -23.106203934654577;
      45: return -23.631344880788809;
      46: return -24.156485841796897;
      47: return -24.681626813140699;
      48: return -25.206767791666692;
      49: return -25.731908775183530;
      50: return -26.257049762168464;
      51: return -26.782190751563345;
      52: return -27.307331742632876;
      53: return -27.832472734866105;
      54: return -28.357613727907985;
      55: return -28.882754721511780;
      56: return -29.407895715506054;
      57: return -29.933036709771663;
      58: return -30.458177704225818;
      59: return -30.983318698810997;
      60: return -31.508459693487225;
      61: return -32.033600688226713;
      62: return -32.558741683010169;
      63: return -33.083882677824171;
      default: return -63;
   endcase
endfunction
