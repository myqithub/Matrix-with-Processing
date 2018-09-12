char[][] harfler;

char[] varOlanHarfler = { 'Ş', '$', '£', '%', 'Y', 'ü', 'é', 'ß', 'æ', '@', '8', '4', '0', '1'};

int[] satirHarfBas;
int[] satirHarfSon;

int sa_mi = 54;
int su_mi = 34;

int tekrar = 10;

int boyut = 24;

void setup() {
  size(800, 600, P2D);
  
  harfler = new char[sa_mi][su_mi];
  satirHarfBas = new int[sa_mi];
  satirHarfSon = new int[sa_mi];
  
  for(int i = 0; i < sa_mi; i++) {
    satirHarfBas[i] = 0;
    satirHarfSon[i] = 0;
  }
  
  for(int i = 0; i < sa_mi; i++) {
    for(int j = 0; j < su_mi; j++) {
      harfler[i][j] = varOlanHarfler[int(random(varOlanHarfler.length))];
    }
  }
}

void mantik() {
  harfArttir();
  
  if(random(1) < 0.5f) {
    harfAzalt();
  }
}

void draw() {
  for(int i = 0; i < tekrar; i++){
    mantik();
  }
  background(#242924);
  
  textSize(boyut - 2);
  
  for(int i = 0; i < sa_mi; i++) {
    fill(#448155);
    for(int j = satirHarfBas[i]; j < satirHarfSon[i]; j++) {
      if(random(1) < 0.02f) {
        harfDonustur();
        fill(#7AD37D);
      } else { 
        fill(#448155);
      }
      if(j == satirHarfSon[i] - 1) {
        fill(#7AD37D);
      }
      text(harfler[i][j], i * boyut, j * boyut); 
    }
  }
}

void harfArttir(){
  int ind = int(random(sa_mi));
  if(satirHarfSon[ind] < su_mi - 1) {
    satirHarfSon[ind]++;
  }
}

void harfAzalt(){
  int ind = int(random(sa_mi));
  if(satirHarfBas[ind] < su_mi - 1) {
    if( satirHarfBas[ind] < satirHarfSon[ind] - 1) {
      satirHarfBas[ind]++;
    } else {
      satirHarfBas[ind] = 0;
      satirHarfSon[ind] = 0;
    }
  }
}

void harfDonustur() {
  harfler[int(random(sa_mi))][int(random(su_mi))] = varOlanHarfler[int(random(varOlanHarfler.length))];
}
