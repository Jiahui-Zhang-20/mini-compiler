<div id="top"></div>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
<!-- [![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url] -->



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Jiahui-Zhang-20/mini-compiler">
    <img src="https://i0.wp.com/www.worldofcomputing.net/wp-content/uploads/2013/01/turingMachine.gif?resize=400%2C274" width="600" height="300">
  </a>

  <a><h1 align="center">Mini-compiler</h1></a>

</div>

<!-- ABOUT THE PROJECT -->
## About The Project

<p>The Mini-compiler translates a small C-style language to MIPS assembly code. The compiler is built using compiler construction tools such as Jlex, Java CUP, and Spim. The aim of this project is to write a full compiler comprising the scanner and parser as the front-end and error checking, optimization, and assembly code generation as the backend.
</p>

<p> The language that this compiler translatets is a C-style statically typed language that includes basic features such as structs and function declarations. The lexical analyzer that tokenizes the input is generated through JLex, a Java lexical analyzer generator. The LALR parser is generated through JAVA CUP. The parse tree is generated, where name analysis and type checking are performed separately to produce the abstract syntax tree (AST). From the AST, the program is ultimately translated into MIPS assembly code.
</p>

<p>
The theoretical underpinning of this project is based on the text, <a href="https://www.oreilly.com/library/view/engineering-a-compiler/9780080916613/"><i>Engineering a Compiler</i></a> by Cooper and Torczon.
</p>


<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

Jiahui (Jack) Zhang - jiahui.zhang.20@gmail.com

Project Link: [https://github.com/Jiahui-Zhang-20/mini-compiler](https://github.com/Jiahui-Zhang-20/mini-compiler)

<p align="right">(<a href="#top">back to top</a>)</p>