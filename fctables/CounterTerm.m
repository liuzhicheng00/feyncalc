(* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ *)

(* :Title: CounterTerm*)

(* :Author: Rolf Mertig *)

(* ------------------------------------------------------------------------ *)
(* :History: File created on 21 April '98 at 11:32 *)
(* ------------------------------------------------------------------------ *)

(* ------------------------------------------------------------------------ *)

BeginPackage["HighEnergyPhysics`fctables`CounterTerm`",{"HighEnergyPhysics`FeynCalc`"}];

CounterTerm::"usage"= "CounterTerm[name] is a data base of counter terms.
CounterTerm is also an option for several Feynman rule
functions.";

(* ------------------------------------------------------------------------ *)

Begin["`Private`"];
   

MakeContext[CA,CouplingConstant,
 CF,Dimension, Epsilon,Tf,Nf, Gauge, Gstrong];

Options[CounterTerm] = 
  {CouplingConstant -> Gstrong, Dimension -> (4+Epsilon),
       Gauge -> 1, QuarkMass -> Global`M};

CounterTerm[x_Symbol,opts___Rule] := CounterTerm[ToString[x], opts];

CounterTerm[x_, opts___Rule] := Block[{ct,alphas,adp, xi},
(* hep-ph/9803493 *)

{d, xi, gstrong, m} = {Dimension, Gauge, Gstrong, QuarkMass} /. 
                      {opts} /. Options[CounterTerm] ;

tareps = (4-d)/2;

alphaS = gstrong^2/(4 Pi);

adp = alphaS/(4 Pi);

ct["Z2"] = 1 + adp (- xi CF ) (1)/( tareps ) + adp^2  (
    (  ( xi^2)/(2) CF + (  (3 xi)/(4) +  ( xi^2)/(4) ) CA
    )  (1)/( tareps ^2)  +
    ( -(  (25)/(8) +  xi +  (  xi^2)/(8) )  CA + Tf Nf +
    (3)/(4) CF) (1)/( tareps )  ) CF;

ct["Z3"] = 1 +  ( alpha_s)/(8 Pi) (((13)/(3)- xi  ) CA -
      (8)/(3)Tf Nf)  (1)/( tareps ) ;

ct["Zg"] = 1 -  adp  (  (11)/(3) CA- (4)/(3) Tf Nf ) (1)/( tareps ) ;

ct["Zm"] = 1 -  adp   (3 CF  )  (1)/( tareps ) +
      (  adp  )^2 CF ( ( (11)/(2) CA - 2Tf Nf+ (9)/(2) CF)
      (1)/( tareps ^2) - ( (97)/(12) CA- (5)/(3) Tf Nf+ (3)/(4) CF)
        (1)/( tareps )  ) ;

ct["deltam"] := Expand[ct["Zm"] m, m] - m;

ct[x]];

End[]; EndPackage[];
(* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ *)
If[$VeryVerbose > 0,WriteString["stdout", "CounterTerm | \n "]];
Null
