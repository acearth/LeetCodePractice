//  Created by ArthurAce on 8/14/15
//  Copyright (c) 2015 ArthurAce. All rights reserved.
// @PURPOSE: regex matching

#include<stdbool.h>
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
        if (s[0]!=p[0]&&p[0]!='.'||strlen(s)==0){
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
