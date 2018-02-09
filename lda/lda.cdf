(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 11.1' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1064,         20]
NotebookDataLength[     22002,        500]
NotebookOptionsPosition[     21173,        464]
NotebookOutlinePosition[     21622,        484]
CellTagsIndexPosition[     21579,        481]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Linear Decoding Analysis", "Title",ExpressionUUID->"37352e6e-4452-4b68-bf8e-8711a363fc6b"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"load", " ", "key"}], "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"SetDirectory", "@", 
     RowBox[{"NotebookDirectory", "[", "]"}]}], ";"}], "\[IndentingNewLine]", 
   
   RowBox[{
    RowBox[{"str", " ", "=", " ", 
     RowBox[{"ReadString", "[", "\"\<out5.txt\>\"", "]"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"data", " ", "=", " ", 
     RowBox[{"ToExpression", "[", "str", "]"}]}], ";"}]}]}]], "Input",Expressi\
onUUID->"0124383e-1f2f-482c-8a14-e3abc981622c"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"AES", " ", "s"}], "-", "box"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"$sbox", "=", 
     RowBox[{"{", 
      RowBox[{
      "99", ",", "124", ",", "119", ",", "123", ",", "242", ",", "107", ",", 
       "111", ",", "197", ",", " ", "48", ",", "1", ",", "103", ",", "43", 
       ",", "254", ",", "215", ",", "171", ",", "118", ",", " ", "202", ",", 
       "130", ",", "201", ",", "125", ",", "250", ",", "89", ",", "71", ",", 
       "240", ",", " ", "173", ",", "212", ",", "162", ",", "175", ",", "156",
        ",", "164", ",", "114", ",", "192", ",", " ", "183", ",", "253", ",", 
       "147", ",", "38", ",", "54", ",", "63", ",", "247", ",", "204", ",", 
       " ", "52", ",", "165", ",", "229", ",", "241", ",", "113", ",", "216", 
       ",", "49", ",", "21", ",", " ", "4", ",", "199", ",", "35", ",", "195",
        ",", "24", ",", "150", ",", "5", ",", "154", ",", " ", "7", ",", "18",
        ",", "128", ",", "226", ",", "235", ",", "39", ",", "178", ",", "117",
        ",", " ", "9", ",", "131", ",", "44", ",", "26", ",", "27", ",", 
       "110", ",", "90", ",", "160", ",", " ", "82", ",", "59", ",", "214", 
       ",", "179", ",", "41", ",", "227", ",", "47", ",", "132", ",", " ", 
       "83", ",", "209", ",", "0", ",", "237", ",", "32", ",", "252", ",", 
       "177", ",", "91", ",", " ", "106", ",", "203", ",", "190", ",", "57", 
       ",", "74", ",", "76", ",", "88", ",", "207", ",", " ", "208", ",", 
       "239", ",", "170", ",", "251", ",", "67", ",", "77", ",", "51", ",", 
       "133", ",", " ", "69", ",", "249", ",", "2", ",", "127", ",", "80", 
       ",", "60", ",", "159", ",", "168", ",", " ", "81", ",", "163", ",", 
       "64", ",", "143", ",", "146", ",", "157", ",", "56", ",", "245", ",", 
       " ", "188", ",", "182", ",", "218", ",", "33", ",", "16", ",", "255", 
       ",", "243", ",", "210", ",", " ", "205", ",", "12", ",", "19", ",", 
       "236", ",", "95", ",", "151", ",", "68", ",", "23", ",", " ", "196", 
       ",", "167", ",", "126", ",", "61", ",", "100", ",", "93", ",", "25", 
       ",", "115", ",", " ", "96", ",", "129", ",", "79", ",", "220", ",", 
       "34", ",", "42", ",", "144", ",", "136", ",", " ", "70", ",", "238", 
       ",", "184", ",", "20", ",", "222", ",", "94", ",", "11", ",", "219", 
       ",", " ", "224", ",", "50", ",", "58", ",", "10", ",", "73", ",", "6", 
       ",", "36", ",", "92", ",", " ", "194", ",", "211", ",", "172", ",", 
       "98", ",", "145", ",", "149", ",", "228", ",", "121", ",", " ", "231", 
       ",", "200", ",", "55", ",", "109", ",", "141", ",", "213", ",", "78", 
       ",", "169", ",", " ", "108", ",", "86", ",", "244", ",", "234", ",", 
       "101", ",", "122", ",", "174", ",", "8", ",", " ", "186", ",", "120", 
       ",", "37", ",", "46", ",", "28", ",", "166", ",", "180", ",", "198", 
       ",", " ", "232", ",", "221", ",", "116", ",", "31", ",", "75", ",", 
       "189", ",", "139", ",", "138", ",", " ", "112", ",", "62", ",", "181", 
       ",", "102", ",", "72", ",", "3", ",", "246", ",", "14", ",", " ", "97",
        ",", "53", ",", "87", ",", "185", ",", "134", ",", "193", ",", "29", 
       ",", "158", ",", " ", "225", ",", "248", ",", "152", ",", "17", ",", 
       "105", ",", "217", ",", "142", ",", "148", ",", " ", "155", ",", "30", 
       ",", "135", ",", "233", ",", "206", ",", "85", ",", "40", ",", "223", 
       ",", " ", "140", ",", "161", ",", "137", ",", "13", ",", "191", ",", 
       "230", ",", "66", ",", "104", ",", " ", "65", ",", "153", ",", "45", 
       ",", "15", ",", "176", ",", "84", ",", "187", ",", "22"}], "}"}]}], 
    ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"AESsbox", "[", "x_", "]"}], ":=", 
     RowBox[{"$sbox", "[", 
      RowBox[{"[", 
       RowBox[{"x", "+", "1"}], "]"}], "]"}]}], ";"}], "\[IndentingNewLine]", 
   
   RowBox[{"(*", " ", 
    RowBox[{
    "compute", " ", "the", " ", "hypothesis", " ", "intermediate", " ", 
     "variable"}], " ", "*)"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"ComputeGuess", "[", 
      RowBox[{
      "plaintext_", ",", "keyGuess_", ",", "sboxNum_", ",", "bitNum_"}], 
      "]"}], ":=", 
     RowBox[{"BitGet", "[", 
      RowBox[{
       RowBox[{"AESsbox", "[", 
        RowBox[{"BitXor", "[", 
         RowBox[{
          RowBox[{"plaintext", "[", 
           RowBox[{"[", 
            RowBox[{"sboxNum", "+", "1"}], "]"}], "]"}], ",", "keyGuess"}], 
         "]"}], "]"}], ",", "bitNum"}], "]"}]}], ";"}]}]}]], "Input",Expressio\
nUUID->"d6472647-ac8b-4de1-93ea-50ed73983c9c"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"LinearMat", "[", "data_", "]"}], ":=", 
    RowBox[{
     RowBox[{
      RowBox[{"Append", "[", 
       RowBox[{"#", ",", "1"}], "]"}], "&"}], "/@", 
     RowBox[{"data", "[", 
      RowBox[{"[", 
       RowBox[{"All", ",", "2"}], "]"}], "]"}]}]}], ";"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"LinearBreak", "[", "data_", "]"}], ":=", 
    RowBox[{"Module", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
       "Mat", ",", "bitNum", ",", "sboxNum", ",", "keyGuess", ",", "c", ",", 
        "v"}], "}"}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"Mat", "=", 
        RowBox[{"LinearMat", "[", "data", "]"}]}], ";", "\[IndentingNewLine]", 
       RowBox[{"For", "[", 
        RowBox[{
         RowBox[{"keyGuess", "=", "0"}], ",", 
         RowBox[{"keyGuess", " ", "\[LessEqual]", "255"}], ",", 
         RowBox[{"keyGuess", "++"}], ",", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"For", "[", 
           RowBox[{
            RowBox[{"bitNum", "=", "0"}], ",", 
            RowBox[{"bitNum", "\[LessEqual]", "7"}], ",", 
            RowBox[{"bitNum", "++"}], ",", "\[IndentingNewLine]", 
            RowBox[{
             RowBox[{"For", "[", 
              RowBox[{
               RowBox[{"sboxNum", "=", "0"}], ",", 
               RowBox[{"sboxNum", "\[LessEqual]", "15"}], ",", 
               RowBox[{"sboxNum", "++"}], ",", "\[IndentingNewLine]", 
               RowBox[{
                RowBox[{"v", "=", 
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"ComputeGuess", "[", 
                    RowBox[{
                    "#", ",", "keyGuess", ",", "sboxNum", ",", "bitNum"}], 
                    "]"}], "&"}], ")"}], "/@", 
                  RowBox[{"data", "[", 
                   RowBox[{"[", 
                    RowBox[{"All", ",", "1"}], "]"}], "]"}]}]}], ";", 
                "\[IndentingNewLine]", 
                RowBox[{"Quiet", "[", 
                 RowBox[{"c", "=", 
                  RowBox[{"LinearSolve", "[", 
                   RowBox[{"Mat", ",", "v", ",", 
                    RowBox[{"Modulus", "\[Rule]", "2"}]}], "]"}]}], "]"}], 
                ";", "\[IndentingNewLine]", 
                RowBox[{"If", "[", 
                 RowBox[{
                  RowBox[{
                   RowBox[{"c", "[", 
                    RowBox[{"[", "0", "]"}], "]"}], "=!=", "LinearSolve"}], 
                  ",", 
                  RowBox[{
                   RowBox[{"Print", "[", 
                    RowBox[{
                    "\"\<!!!!!!!!!!!!! \>\"", ",", "sboxNum", ",", 
                    "\"\< - \>\"", ",", "bitNum", ",", "\"\< - \>\"", ",", 
                    "keyGuess", ",", "\"\< !!!!!!!!!!!!!\>\"", ",", " ", 
                    "\"\< - \>\"", ",", " ", "c", ",", " ", 
                    RowBox[{"c", "//", "Tally"}]}], "]"}], ";"}]}], "]"}], 
                ";"}]}], "\[IndentingNewLine]", "]"}], ";"}]}], 
           "\[IndentingNewLine]", "]"}], ";"}]}], "\[IndentingNewLine]", 
        "]"}], ";"}]}], "\[IndentingNewLine]", "]"}]}], ";"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]"}], "Input",ExpressionUUID->\
"0ed5ac66-e47d-4c29-8770-22f08ada2745"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"LinearBreak", "[", "data", "]"}]], "Input",ExpressionUUID->"c45d59ea-5a3a-4c1d-9b1a-e2019e45366a"],

Cell[CellGroupData[{

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"!!!!!!!!!!!!! \"\>", "\[InvisibleSpace]", "4", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", "0", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", "39", 
   "\[InvisibleSpace]", "\<\" !!!!!!!!!!!!!\"\>", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
    "1", ",", "1", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "1",
      ",", "1", ",", "1", ",", "0", ",", "0", ",", "0", ",", "1", ",", "0", 
     ",", "0", ",", "1", ",", "0", ",", "0", ",", "0", ",", "0", ",", "1", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0"}], "}"}], 
   "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"1", ",", "8"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "34"}], "}"}]}], "}"}]}],
  SequenceForm[
  "!!!!!!!!!!!!! ", 4, " - ", 0, " - ", 39, " !!!!!!!!!!!!!", " - ", {1, 1, 0,
    0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {{1, 8}, {0, 34}}],
  Editable->False]], "Print",ExpressionUUID->"41839ec4-4274-4acc-b3a4-\
783003689bb0"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"!!!!!!!!!!!!! \"\>", "\[InvisibleSpace]", "4", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", "1", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", "39", 
   "\[InvisibleSpace]", "\<\" !!!!!!!!!!!!!\"\>", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
    "1", ",", "1", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "1",
      ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "1", ",", "1", ",", "0", ",", "0", ",", "0", ",", "0", ",", "1", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0"}], "}"}], 
   "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"1", ",", "6"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "36"}], "}"}]}], "}"}]}],
  SequenceForm[
  "!!!!!!!!!!!!! ", 4, " - ", 1, " - ", 39, " !!!!!!!!!!!!!", " - ", {1, 1, 0,
    0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {{1, 6}, {0, 36}}],
  Editable->False]], "Print",ExpressionUUID->"acef7e77-bae4-41ef-a745-\
416dfedf03d0"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"!!!!!!!!!!!!! \"\>", "\[InvisibleSpace]", "4", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", "2", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", "39", 
   "\[InvisibleSpace]", "\<\" !!!!!!!!!!!!!\"\>", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
    "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "1", ",", "1",
      ",", "1", ",", "0", ",", "1", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "1", ",", "0", ",", "1", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0"}], "}"}], 
   "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"0", ",", "36"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "6"}], "}"}]}], "}"}]}],
  SequenceForm[
  "!!!!!!!!!!!!! ", 4, " - ", 2, " - ", 39, " !!!!!!!!!!!!!", " - ", {0, 0, 0,
    0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {{0, 36}, {1, 6}}],
  Editable->False]], "Print",ExpressionUUID->"54991858-da2a-4cef-84f2-\
eafd37649448"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"!!!!!!!!!!!!! \"\>", "\[InvisibleSpace]", "4", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", "3", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", "39", 
   "\[InvisibleSpace]", "\<\" !!!!!!!!!!!!!\"\>", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
    "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0",
      ",", "1", ",", "0", ",", "0", ",", "0", ",", "0", ",", "1", ",", "0", 
     ",", "1", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "1", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0"}], "}"}], 
   "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"0", ",", "38"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "4"}], "}"}]}], "}"}]}],
  SequenceForm[
  "!!!!!!!!!!!!! ", 4, " - ", 3, " - ", 39, " !!!!!!!!!!!!!", " - ", {0, 0, 0,
    0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {{0, 38}, {1, 4}}],
  Editable->False]], "Print",ExpressionUUID->"53d77fd6-4001-41b1-a15f-\
0508f37b267d"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"!!!!!!!!!!!!! \"\>", "\[InvisibleSpace]", "4", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", "4", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", "39", 
   "\[InvisibleSpace]", "\<\" !!!!!!!!!!!!!\"\>", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
    "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "1", ",", "0",
      ",", "1", ",", "1", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "1", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0"}], "}"}], 
   "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"0", ",", "38"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "4"}], "}"}]}], "}"}]}],
  SequenceForm[
  "!!!!!!!!!!!!! ", 4, " - ", 4, " - ", 39, " !!!!!!!!!!!!!", " - ", {0, 0, 0,
    0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {{0, 38}, {1, 4}}],
  Editable->False]], "Print",ExpressionUUID->"8f1d0174-778b-48c3-bcc2-\
6a7a2e1c223f"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"!!!!!!!!!!!!! \"\>", "\[InvisibleSpace]", "4", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", "5", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", "39", 
   "\[InvisibleSpace]", "\<\" !!!!!!!!!!!!!\"\>", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
    "0", ",", "0", ",", "0", ",", "0", ",", "1", ",", "1", ",", "1", ",", "1",
      ",", "0", ",", "0", ",", "1", ",", "0", ",", "0", ",", "1", ",", "0", 
     ",", "1", ",", "0", ",", "0", ",", "1", ",", "0", ",", "0", ",", "1", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0"}], "}"}], 
   "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"0", ",", "33"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "9"}], "}"}]}], "}"}]}],
  SequenceForm[
  "!!!!!!!!!!!!! ", 4, " - ", 5, " - ", 39, " !!!!!!!!!!!!!", " - ", {0, 0, 0,
    0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {{0, 33}, {1, 9}}],
  Editable->False]], "Print",ExpressionUUID->"e3c669cc-f707-444e-a032-\
cfc5330497e3"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"!!!!!!!!!!!!! \"\>", "\[InvisibleSpace]", "4", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", "6", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", "39", 
   "\[InvisibleSpace]", "\<\" !!!!!!!!!!!!!\"\>", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
    "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "1", ",", "1", ",", "1",
      ",", "1", ",", "1", ",", "0", ",", "1", ",", "0", ",", "1", ",", "0", 
     ",", "1", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0"}], "}"}], 
   "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"0", ",", "34"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "8"}], "}"}]}], "}"}]}],
  SequenceForm[
  "!!!!!!!!!!!!! ", 4, " - ", 6, " - ", 39, " !!!!!!!!!!!!!", " - ", {0, 0, 0,
    0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {{0, 34}, {1, 8}}],
  Editable->False]], "Print",ExpressionUUID->"547d7c76-c332-4a05-99d9-\
5d559363c7a3"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"!!!!!!!!!!!!! \"\>", "\[InvisibleSpace]", "4", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", "7", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", "39", 
   "\[InvisibleSpace]", "\<\" !!!!!!!!!!!!!\"\>", 
   "\[InvisibleSpace]", "\<\" - \"\>", "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
    "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "1", ",", "1", ",", "0",
      ",", "1", ",", "0", ",", "1", ",", "1", ",", "0", ",", "1", ",", "0", 
     ",", "1", ",", "1", ",", "0", ",", "1", ",", "0", ",", "0", ",", "1", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
     ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0"}], "}"}], 
   "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"0", ",", "32"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "10"}], "}"}]}], "}"}]}],
  SequenceForm[
  "!!!!!!!!!!!!! ", 4, " - ", 7, " - ", 39, " !!!!!!!!!!!!!", " - ", {0, 0, 0,
    0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {{0, 32}, {1, 10}}],
  Editable->False]], "Print",ExpressionUUID->"a9bb116c-a87b-4ee9-83a4-\
63f2de211831"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{2560, 1315},
Visible->True,
ScrollingOptions->{"VerticalScrollRange"->Fit},
ShowCellBracket->Automatic,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"11.1 for Mac OS X x86 (32-bit, 64-bit Kernel) (April 27, \
2017)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1486, 35, 96, 0, 92, "Title", "ExpressionUUID" -> \
"37352e6e-4452-4b68-bf8e-8711a363fc6b"],
Cell[1585, 37, 569, 16, 96, "Input", "ExpressionUUID" -> \
"0124383e-1f2f-482c-8a14-e3abc981622c"],
Cell[2157, 55, 4674, 83, 180, "Input", "ExpressionUUID" -> \
"d6472647-ac8b-4de1-93ea-50ed73983c9c"],
Cell[6834, 140, 3344, 80, 348, "Input", "ExpressionUUID" -> \
"0ed5ac66-e47d-4c29-8770-22f08ada2745"],
Cell[CellGroupData[{
Cell[10203, 224, 122, 1, 32, "Input", "ExpressionUUID" -> \
"c45d59ea-5a3a-4c1d-9b1a-e2019e45366a"],
Cell[CellGroupData[{
Cell[10350, 229, 1345, 27, 24, "Print", "ExpressionUUID" -> \
"41839ec4-4274-4acc-b3a4-783003689bb0"],
Cell[11698, 258, 1345, 27, 24, "Print", "ExpressionUUID" -> \
"acef7e77-bae4-41ef-a745-416dfedf03d0"],
Cell[13046, 287, 1345, 27, 24, "Print", "ExpressionUUID" -> \
"54991858-da2a-4cef-84f2-eafd37649448"],
Cell[14394, 316, 1345, 27, 24, "Print", "ExpressionUUID" -> \
"53d77fd6-4001-41b1-a15f-0508f37b267d"],
Cell[15742, 345, 1345, 27, 24, "Print", "ExpressionUUID" -> \
"8f1d0174-778b-48c3-bcc2-6a7a2e1c223f"],
Cell[17090, 374, 1345, 27, 24, "Print", "ExpressionUUID" -> \
"e3c669cc-f707-444e-a032-cfc5330497e3"],
Cell[18438, 403, 1345, 27, 24, "Print", "ExpressionUUID" -> \
"547d7c76-c332-4a05-99d9-5d559363c7a3"],
Cell[19786, 432, 1347, 27, 24, "Print", "ExpressionUUID" -> \
"a9bb116c-a87b-4ee9-83a4-63f2de211831"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature OuTiKdVguden1BgdDICiibk9 *)
