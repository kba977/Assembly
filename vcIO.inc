; vcIO.inc declarations for standard I/O ,console I/O Function prototypes
; Copyright (c) FCL 2010. All rights reserved. 
 .686
 .model flat,stdcall
  option casemap:none        ;case sensitive 
; =======================================================================
; 汇编语言可以调用C/C++语言所有的库函,只要对C语言库函数的原型进行说明就可以。

   includelib	msvcrt.lib ; C语言中的 stdio.h  conio.h 的动态链接库
;  C Run-Time Libraries (CRT)
;  C语言I/O库函数的原型说明
;  Function prototypes 
   printf	 PROTO C : dword,:vararg  ;vararg参数：变参，参数个数不确定
   scanf	 PROTO C : dword,:vararg  ;dword参数 ：格式描述串的有效地址。
   _getch    PROTO C : vararg         ;注意：所有的参数都是dword型！
   _kbhit    PROTO C : vararg
; =======================================================================
  
