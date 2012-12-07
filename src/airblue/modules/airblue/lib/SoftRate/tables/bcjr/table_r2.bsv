// generated by compute-ber.py
// table for rate 2 (curve fit)
// (computed without odd hints)

import Real::*;

function data_t get_ber_r2(Bit#(8) hint)
      provisos (RealLiteral#(data_t), Arith#(data_t));
   case (hint) matches
       0: return 0.500000000000000;
       1: return 0.345246539393681;
       2: return 0.217550223576887;
       3: return 0.127861566319081;
       4: return 0.071757542263751;
       5: return 0.039165722796764;
       6: return 0.021041347020468;
       7: return 0.011206406321843;
       8: return 0.005940522198340;
       9: return 0.003141213284829;
      10: return 0.001658801080174;
      11: return 0.000875359636429;
      12: return 0.000461761576524;
      13: return 0.000243536539732;
      14: return 0.000128429757413;
      15: return 0.000067724149620;
      16: return 0.000035711574280;
      17: return 0.000018830760453;
      18: return 0.000009929405712;
      19: return 0.000005235724982;
      20: return 0.000002760764950;
      21: return 0.000001455732343;
      22: return 0.000000767597164;
      23: return 0.000000404748316;
      24: return 0.000000213420762;
      25: return 0.000000112535162;
      26: return 0.000000059338942;
      27: return 0.000000031288975;
      28: return 0.000000016498440;
      29: return 0.000000008699502;
      30: return 0.000000004587182;
      31: return 0.000000002418786;
      32: return 0.000000001275408;
      33: return 0.000000000672513;
      34: return 0.000000000354611;
      35: return 0.000000000186984;
      36: return 0.000000000098595;
      37: return 0.000000000051988;
      38: return 0.000000000027413;
      39: return 0.000000000014455;
      40: return 0.000000000007622;
      41: return 0.000000000004019;
      42: return 0.000000000002119;
      43: return 0.000000000001117;
      44: return 0.000000000000589;
      45: return 0.000000000000311;
      46: return 0.000000000000164;
      47: return 0.000000000000086;
      48: return 0.000000000000046;
      49: return 0.000000000000024;
      50: return 0.000000000000013;
      51: return 0.000000000000007;
      52: return 0.000000000000004;
      53: return 0.000000000000002;
      54: return 0.000000000000001;
      55: return 0.000000000000001;
      56: return 0.000000000000000;
      57: return 0.000000000000000;
      58: return 0.000000000000000;
      59: return 0.000000000000000;
      60: return 0.000000000000000;
      61: return 0.000000000000000;
      62: return 0.000000000000000;
      63: return 0.000000000000000;
      default: return 0;
   endcase
endfunction
