; vcIO.inc declarations for standard I/O ,console I/O Function prototypes
; Copyright (c) FCL 2010. All rights reserved. 
 .686
 .model flat,stdcall
  option casemap:none        ;case sensitive 
; =======================================================================
; ������Կ��Ե���C/C++�������еĿ⺯,ֻҪ��C���Կ⺯����ԭ�ͽ���˵���Ϳ��ԡ�

   includelib	msvcrt.lib ; C�����е� stdio.h  conio.h �Ķ�̬���ӿ�
;  C Run-Time Libraries (CRT)
;  C����I/O�⺯����ԭ��˵��
;  Function prototypes 
   printf	 PROTO C : dword,:vararg  ;vararg��������Σ�����������ȷ��
   scanf	 PROTO C : dword,:vararg  ;dword���� ����ʽ����������Ч��ַ��
   _getch    PROTO C : vararg         ;ע�⣺���еĲ�������dword�ͣ�
   _kbhit    PROTO C : vararg
; =======================================================================
  