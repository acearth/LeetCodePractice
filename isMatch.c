nclude<stdbool.h>
#include<stdio.h>
#include<string.h>
bool isMatch(char* s, char* p){
    if(strlen(p)==0){
        return strlen(s)==0;
    }else if(strlen(p)==1){
        if (strlen(s)!=1){
            return false;
        }
        return s[0]==p[0]||p[0]=='.';
    }else if(p[1]!='*'){
        if (s[0]!=p[0]&&p[0]!='.'||strlen(s)==0){ //don't care s.empty?,  s[0] will do it
            return false;
        }
        return isMatch(s+1,p+1);
    }else{
        if(isMatch(s,p+2)){
            return true;
        }
        int i=0;
        while(i<strlen(s)&&(s[i]==p[0]||p[0]=='.')){
            i++;
            if(isMatch(s+i,p+2)){
                return true;
            }
        }
    }
    return false;
}
int main(){
    char* s1="aa";
    char* p1="aa";
    if(isMatch(s1,p1)){
        printf("true\n");
    }else{
        printf("false\n");
    }
    p1="a*";
    if(isMatch(s1,p1)){
        printf("true\n");
    }else{
        printf("false\n");
    }
    p1=".*";
    if(isMatch(s1,p1)){
        printf("true\n");
    }else{
        printf("false\n");
    }
    s1="";
    p1="..*";
    if(isMatch(s1,p1)){
        printf("true\n");
    }else{
        printf("false\n");
    }

    
}
