/// @description Inicialização do terminal binário (2 Pontos, 6 IDs únicos de saída para global.terra)

// --- ESTADOS DE FLUXO ---
intro = true;
espera = false;
destino = rm_1_terra;

// --- TEXTOS DO SCRIBBLE ---
texto_intro = scribble("[c_green]INICIALIZANDO TERMINAL DE AMOSTRAS...\nINSIRA A SEQUENCIA BINARIA DOS ELEMENTOS.[delay,5000]");
typist_intro = scribble_typist();
typist_intro.in(0.5, 0);

texto_final_t = scribble("[c_green]VALIDANDO COMPOSICAO QUIMICA[delay,30].[delay,30].[delay,50].[delay]");
typist_final_t = scribble_typist();
typist_final_t.in(0.5, 0);

binario_cache = "";
texto_binario = scribble("");
typist_binario = scribble_typist();

// --- MATRIZ DE LEDS E CONTROLES ---
leds = array_create(32, 0);
cursor = 0;
stick_pode_mover = true;
sequencia_capturada = "";
id_amostra_gerada = 1; // Guarda o valor único que será enviado para global.terra ao coletar

// Proteção caso global.terra venha vazio ("") ou no teste direto da sala (IDs 1 e 2)
if (variable_global_exists("terra") && is_real(global.terra)) {
    ponto_atual = clamp(global.terra - 1, 0, 1);
} else {
    global.terra = 1;
    ponto_atual = 0;
}

// --- GABARITOS (2 pontos em rm_1_terra, cada um com 3 opções de 32 bits limpas) ---
gabaritos = [
    // Ponto 1 (item_id == 1)
    [
        "01000011 01100001 01001101 01100111", // Opção 0 -> CaMg (Solo Fértil - CORRETA)
        "01101011 01101011 01101011 01101011", // Opção 1 -> kkkk (Potássio)
        "01001111 01010011 01001001 00000001"  // Opção 2 -> OSI  (Vidro) 
    ],
    // Ponto 2 (item_id == 2)
    [
        "01000110 01100101 01010011 01101110", // Opção 0 -> FeSN  (ferro e estanho(tampinha de carrafa(referencia fallout)))
        "01000011 01001111 01001000 01001110", // Opção 1 -> COHN (Casca de árvore)
        "01001111 01001000 01000011 01100001"  // Opção 2 -> OHCa (Carcaça animal)
    ]
];

// --- MAPA DE IDS ÚNICOS PARA O BUNKER (global.terra) ---
// Cada opção de cada ponto recebe um número único de 1 a 6 para o obj_terminal ler no bunker
ids_saida_terra = [
    [1, 2, 3], // Ponto 1: Opção 0 -> 1 (Válida) | Opção 1 -> 2 | Opção 2 -> 3
    [4, 5, 6]  // Ponto 2: Opção 0 -> 4          | Opção 1 -> 5 | Opção 2 -> 6
];