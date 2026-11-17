recarga = 2300;		//bateria = recarga, para nao spawnar com bateira 0!!
portinha = false;

//flags de audio!
estado_amostra = 0
scan = false;

//sequencia pra acabar o jogo
jogo_finalizado = false;
global.sequencia_final = false;

texto_final = scribble("[scale,0.8][c_yellow]todas amostras validadas!\nliberando para estudos...\ncontinue as pesquisas...\n [delay] [delay] [delay] [delay]");
typist_texto_final = scribble_typist();
typist_texto_final.in(0.4, 0);