/* -*- Mode: Javascript; indent-tabs-mode:nil; js-indent-level: 2 -*- */
/* vim: set ts=2 et sw=2 tw=80: */

/*************************************************************
 *
 *  MathJax/config/local/local.js
 *  
 *  Include changes and configuration local to your installation
 *  in this file.  For example, common macros can be defined here
 *  (see below).  To use this file, add "local/local.js" to the
 *  config array in MathJax.js or your MathJax.Hub.Config() call.
 *
 *  ---------------------------------------------------------------------
 *  
 *  Copyright (c) 2009-2015 The MathJax Consortium
 * 
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

MathJax.Hub.Register.StartupHook("TeX Jax Ready",function () {
  var TEX = MathJax.InputJax.TeX;

  // place macros here.  E.g.:
  //   TEX.Macro("R","{\\bf R}");
  //   TEX.Macro("op","\\mathop{\\rm #1}",1); // a macro with 1 parameter

TEX.Macro("AA","\\mathbb{A}"); 
TEX.Macro("BB","\\mathbb{B}"); 
TEX.Macro("CC","\\mathbb{C}"); 
TEX.Macro("DD","\\mathbb{D}"); 
TEX.Macro("EE","\\mathbb{E}"); 
TEX.Macro("FF","\\mathbb{F}"); 
TEX.Macro("GG","\\mathbb{G}"); 
TEX.Macro("HH","\\mathbb{H}"); 
TEX.Macro("II","\\mathbb{I}"); 
TEX.Macro("JJ","\\mathbb{J}"); 
TEX.Macro("KK","\\mathbb{K}"); 
TEX.Macro("LL","\\mathbb{L}"); 
TEX.Macro("MM","\\mathbb{M}"); 
TEX.Macro("NN","\\mathbb{N}"); 
TEX.Macro("OO","\\mathbb{O}"); 
TEX.Macro("PP","\\mathbb{P}"); 
TEX.Macro("QQ","\\mathbb{Q}"); 
TEX.Macro("RR","\\mathbb{R}"); 
TEX.Macro("SS","\\mathbb{S}"); 
TEX.Macro("TT","\\mathbb{T}"); 
TEX.Macro("UU","\\mathbb{U}"); 
TEX.Macro("VV","\\mathbb{V}"); 
TEX.Macro("WW","\\mathbb{W}"); 
TEX.Macro("XX","\\mathbb{X}"); 
TEX.Macro("YY","\\mathbb{Y}"); 
TEX.Macro("ZZ","\\mathbb{Z}"); 

TEX.Macro("va","\\boldsymbol{a}"); 
TEX.Macro("vb","\\boldsymbol{b}"); 
TEX.Macro("vc","\\boldsymbol{c}"); 
TEX.Macro("vd","\\boldsymbol{d}"); 
TEX.Macro("ve","\\boldsymbol{e}"); 
TEX.Macro("vf","\\boldsymbol{f}"); 
TEX.Macro("vg","\\boldsymbol{g}"); 
TEX.Macro("vh","\\boldsymbol{h}"); 
TEX.Macro("vi","\\boldsymbol{i}"); 
TEX.Macro("vj","\\boldsymbol{j}"); 
TEX.Macro("vk","\\boldsymbol{k}"); 
TEX.Macro("vl","\\boldsymbol{l}"); 
TEX.Macro("vm","\\boldsymbol{m}"); 
TEX.Macro("vn","\\boldsymbol{n}"); 
TEX.Macro("vo","\\boldsymbol{o}"); 
TEX.Macro("vp","\\boldsymbol{p}"); 
TEX.Macro("vq","\\boldsymbol{q}"); 
TEX.Macro("vr","\\boldsymbol{r}"); 
TEX.Macro("vs","\\boldsymbol{s}"); 
TEX.Macro("vt","\\boldsymbol{t}"); 
TEX.Macro("vu","\\boldsymbol{u}"); 
TEX.Macro("vv","\\boldsymbol{v}"); 
TEX.Macro("vw","\\boldsymbol{w}"); 
TEX.Macro("vx","\\boldsymbol{x}"); 
TEX.Macro("vy","\\boldsymbol{y}"); 
TEX.Macro("vz","\\boldsymbol{z}");
TEX.Macro("vA","\\boldsymbol{A}"); 
TEX.Macro("vB","\\boldsymbol{B}"); 
TEX.Macro("vC","\\boldsymbol{C}"); 
TEX.Macro("vD","\\boldsymbol{D}"); 
TEX.Macro("vE","\\boldsymbol{E}"); 
TEX.Macro("vF","\\boldsymbol{F}"); 
TEX.Macro("vG","\\boldsymbol{G}"); 
TEX.Macro("vH","\\boldsymbol{H}"); 
TEX.Macro("vI","\\boldsymbol{I}"); 
TEX.Macro("vJ","\\boldsymbol{J}"); 
TEX.Macro("vK","\\boldsymbol{K}"); 
TEX.Macro("vL","\\boldsymbol{L}"); 
TEX.Macro("vM","\\boldsymbol{M}"); 
TEX.Macro("vN","\\boldsymbol{N}"); 
TEX.Macro("vO","\\boldsymbol{O}"); 
TEX.Macro("vP","\\boldsymbol{P}"); 
TEX.Macro("vQ","\\boldsymbol{Q}"); 
TEX.Macro("vR","\\boldsymbol{R}"); 
TEX.Macro("vS","\\boldsymbol{S}"); 
TEX.Macro("vT","\\boldsymbol{T}"); 
TEX.Macro("vU","\\boldsymbol{U}"); 
TEX.Macro("vV","\\boldsymbol{V}"); 
TEX.Macro("vW","\\boldsymbol{W}"); 
TEX.Macro("vX","\\boldsymbol{X}"); 
TEX.Macro("vY","\\boldsymbol{Y}"); 
TEX.Macro("vZ","\\boldsymbol{Z}"); 
 
TEX.Macro("from","\\colon");

TEX.Macro("ensuremath"," ");
TEX.Macro("protect"," ");
TEX.Macro("relax"," ");


});

MathJax.Ajax.loadComplete("[MathJax]/config/local/local.js");

