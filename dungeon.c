int dfs(int ** dg, int lc, int cc, int i,int j,int curHp, int minHp){
	if (i==lc-1 && j==cc-1){
		return minHp;
	}
	int r,d;
	int left=0;
	int right=0;
	if(j+1<cc){
		int neoHp=curHp+dg[i][j+1];
		int neoMin= minHp>neoHp ? neoHp:minHp;
		r=dfs(dg,lc,cc,i,j+1,neoHp,neoMin);
		left=1;
	}
	if(i+1<lc){
		int neoHp=curHp+dg[i+1][j];
		int neoMin= minHp>neoHp ? neoHp:minHp;
		d=dfs(dg,lc,cc,i+1,j,neoHp,neoMin);
		right=2;
	}
	if(left!=1){
		return d;
	}else{
		return r>d? r:d;
	}
}

int calculateMinimumHP(int** dungeon, int dungeonRowSize, int dungeonColSize) {
	int	r=dfs(dungeon,dungeonRowSize,dungeonColSize,0,0,dungeon[0][0],dungeon[0][0]);
	return r>0 ? 1:1-r;
}

int main(){}





