(* :Title: Apart1 *)

(* :Author: Rolf Mertig *)

(* ------------------------------------------------------------------------ *)
(* :History: created 4 March '97 at 14:34 *)
(* ------------------------------------------------------------------------ *)

(* ------------------------------------------------------------------------ *)

BeginPackage["HighEnergyPhysics`general`Apart1`",{"HighEnergyPhysics`FeynCalc`"}];

Apart1::"usage"=
"Apart1[expr, x] is equivalent to Apart[expr, x],
but it fixes a Mathematica bug."; 

(* ------------------------------------------------------------------------ *)

Begin["`Private`"];
   

Apart1[expr_, x_] := If[ FreeQ[expr, Complex], 
                         Apart[expr,x],
                         Apart[expr /. Complex[0,a_] :> i a, x] /. i->I
                       ];
(*

murks =  (1 - x)^4  x (21 + 13 x + 3 x^2 ) y^3  PolyLog[2,
         (x + y - x y) / (x (1-y) )]

murks = 
  -((1 - x)^4*x*(21 + 13*x + 3*x^2))/4 - 
   (11*I)/24*Pi*(1 - x)^4*x*(21 + 13*x + 3*x^2) + 
   ((1 - x)^4*x^2*(21 + 13*x + 3*x^2))/(36*(-1 + x)^4) - 
   (I/12*Pi*(1 - x)^4*x^2*(21 + 13*x + 3*x^2))/(-1 + x)^4 - 
   (7*(1 - x)^4*x^3*(21 + 13*x + 3*x^2))/(48*(-1 + x)^4) + 
   ((3*I)/8*Pi*(1 - x)^4*x^3*(21 + 13*x + 3*x^2))/(-1 + x)^4 + 
   (11*(1 - x)^4*x^4*(21 + 13*x + 3*x^2))/(24*(-1 + x)^4) - 
   ((3*I)/4*Pi*(1 - x)^4*x^4*(21 + 13*x + 3*x^2))/(-1 + x)^4 - 
   (49*(1 - x)^4*x^5*(21 + 13*x + 3*x^2))/(144*(-1 + x)^4) + 
   ((11*I)/24*Pi*(1 - x)^4*x^5*(21 + 13*x + 3*x^2))/(-1 + x)^4 + 
   ((1 - x)^4*x*(21 + 13*x + 3*x^2)*Zeta2)/4 + 
   (11*(1 - x)^4*x*(21 + 13*x + 3*x^2)*Log[x])/24 + 
   I/4*Pi*(1 - x)^4*x*(21 + 13*x + 3*x^2)*Log[x] + 
   ((1 - x)^4*x^2*(21 + 13*x + 3*x^2)*Log[x])/(12*(-1 + x)^4) - 
   (3*(1 - x)^4*x^3*(21 + 13*x + 3*x^2)*Log[x])/(8*(-1 + x)^4) + 
   (3*(1 - x)^4*x^4*(21 + 13*x + 3*x^2)*Log[x])/(4*(-1 + x)^4) - 
   (11*(1 - x)^4*x^5*(21 + 13*x + 3*x^2)*Log[x])/(24*(-1 + x)^4) - 
   (I/4*Pi*(1 - x)^4*x^5*(21 + 13*x + 3*x^2)*Log[x])/(-1 + x)^4 - 
   ((1 - x)^4*x*(21 + 13*x + 3*x^2)*Log[x]^2)/8 + 
   ((1 - x)^4*x^5*(21 + 13*x + 3*x^2)*Log[x]^2)/(8*(-1 + x)^4) - 
   ((1 - x)^4*x^5*(21 + 13*x + 3*x^2)*PolyLog[2, 1 - x])/(4*(-1 + x)^4) + 
   ((1 - x)^4*x^2*(21 + 13*x + 3*x^2)*
      (-22 + 93*x - 156*x^2 + 85*x^3 + 36*x^3*PolyLog[2, 1 - x]))/
    (144*(-1 + x)^4)

*)

End[]; EndPackage[];


(* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ *)
If[$VeryVerbose > 0,WriteString["stdout", "Apart1 | \n "]];
Null
(* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ *)
