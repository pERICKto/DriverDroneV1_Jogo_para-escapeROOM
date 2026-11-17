/// @description Inicialização do terminal binário vinculado a rm_1_terra

// --- ESTADOS DE FLUXO ---
intro = true;
espera = false;
destino = rm_1_terra;

// --- TEXTOS DO SCRIBBLE ---
texto_intro = scribble("[c_green]INICIALIZANDO TERMINAL DE AMOSTRAS...\nINSIRA A SEQUENCIA BINARIA DOS ELEMENTOS.[delay5000]");
typist_intro = scribble_typist();
typist_intro.in(0.5, 0);

texto_final_t = scribble("[c_green]VALIDANDO COMPOSICAO QUIMICA[delay30].[delay30].[delay50].[delay]");
typist_final_t = scribble_typist();
typist_final_t.in(0.5, 0);

binario_cache = "";
texto_binario = scribble("");
typist_binario = scribble_typist();

// --- MATRIZ DE LEDS E CONTROLES ---
leds = array_create(32, 0);
cursor = 0;
stick_pode_mover = true;
amostra_liberada = -1; // Qual das 3 opções internas (0, 1 ou 2) o jogador destravou
amostra_eh_valida = false;

// Proteção caso global.terra venha vazio ("") ou no teste direto da sala
if (variable_global_exists("terra") && is_real(global.terra)) {
    ponto_atual = clamp(global.terra - 1, 0, 2);
} else {
    global.terra = 1;
    ponto_atual = 0;
}

// --- GABARITOS (3 pontos em rm_1_terra, cada um com 3 opções de 32 bits) ---
gabaritos = [
    // Ponto 1 (global.terra == 1) -> Ex: CA MG (01000011 01000001 01001101 01000111)
    [
        "01000011 01100001 01001101 01100111", // Opção 0 CORRETA --(CaMg), 60%, 15% respectivamente, >AMOSTRA SOLO FÉRTIL<
        "01101011 01101011 01101011 01101011 ", // Opção 1 (Errada) --(KKKK) potassio, potassio, potassio e potassio >muito engraçadinho<
        "01001111  01010011 01001001 00000001", // Opção 0 (O,Si) -- Oxigenio, Silício. >Vidro vidro? é serio? onde voce conseguiu arrumar isso?!<
    ],
    // Ponto 2 (global.terra == 2) -> Preencha com os binários das 3 amostras deste ponto
    [
        "01001111  01010011 01001001 00000001", // Opção 0 (O,Si) -- Oxigenio, Silício. >Vidro cridro, é serio? onde voce xonseguiu arrumar isso?!
        "01000011  01001111  01001000  01001110 ", // Opção 1 (COIN) -- Carbono, Oxigenio, Hidrogenio, Nitrogenio >Casca de árvore<
        "01001111 01001000 01000011 01100001"  // Opção 2 (OHCa) -- Oxigenio, Hidrogenio Carbono >Carcaça animal<
    ],
    // Ponto 3 (global.terra == 3) -> Preencha com os binários das 3 amostras deste ponto
    [
        "11111111 00000000 00000000 00000000", // Opção 0
        "00000000 11111111 00000000 00000000", // Opção 1
        "00000000 00000000 11111111 00000000"  // Opção 2
    ]
];

// Qual das 3 opções internas (0, 1 ou 2) é a verdadeira de cada ponto
resposta_correta_por_ponto = [0, 1, 2];