#pragma once

#define deb_1(a) {if(DBG){debo=1;O GREEN<<#a<<"="<<(a)<<RESET;nl;debo=0;}}
#define deb_2(a,b) {if(DBG){debo=1;O GREEN<<#a<<"="<<(a)<<"  "<<#b<<"="<<(b)<<RESET;nl;debo=0;}}
#define deb_3(a,b,c) {if(DBG){debo=1;O GREEN<<#a<<"="<<(a)<<"  "<<#b<<"="<<(b)<<"  "<<#c<<"="<<(c)<<RESET;nl;debo=0;}}
#define deb_4(a,b,c,d) {if(DBG){debo=1;O GREEN<<#a<<"="<<a<<"  "<<#b<<"="<<b<<"  "<<#c<<"="<<c<<"  "<<#d<<"="<<d<<RESET;nl;debo=0;}}
#define deb_5(a,b,c,d,e) {if(DBG){debo=1;O GREEN<<#a<<"="<<a<<"  "<<#b<<"="<<b<<"  "<<#c<<"="<<c<<"  "<<#d<<"="<<d<<"  "<<#e<<"="<<e<<RESET;nl;debo=0;}}
#define deb_6(a,b,c,d,e,f) {if(DBG){debo=1;O GREEN<<#a<<"="<<a<<"  "<<#b<<"="<<b<<"  "<<#c<<"="<<c<<"  "<<#d<<"="<<d<<"  "<<#e<<"="<<e<<"  "<<#f<<"="<<f<<RESET;nl;debo=0;}}
#define deb(...) GET_MACRO6(__VA_ARGS__,deb_6,deb_5,deb_4,deb_3,deb_2,deb_1)(__VA_ARGS__)
#define GET_MACRO6(_1,_2,_3,_4,_5,_6,NAME,...) NAME


