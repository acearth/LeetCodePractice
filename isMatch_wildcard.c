#include<stdbool.h>
#include<stdio.h>
#include<string.h>
//TDOO: Wrong file,  should do this by NFA.
bool isMatch(char* s, char* p){
	if(strlen(p)==0) return strlen(s)==0;
	if(strlen(p)==1){
		if(p=="*"||p=="?"&&strlen(s)==1 ||p==s) return true;
		return false;
	}else{
		if(strlen(s)==0) return false;
		if(p[0]==s[0]||p[0]=='?') return isMatch(s+1，p+1);
		if(p[0]=='*'){
			for(int i=0;i<strlen(s);i++){
				if(isMatch(s+i,p+1))return true;
			}
		}
	}
	return false;
}

int main(){
	char* s1="aa";
	char* s2="aa";
	printf(isMatch(s1,s2));
}


