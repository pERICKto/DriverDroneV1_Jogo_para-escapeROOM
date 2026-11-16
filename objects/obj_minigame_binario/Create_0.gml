leds = array_create(32, 0);
//cria um uma posicao para cada led no array
cursor = 0;                 // Índice atual do LED selecionado (0 a 31)
ponto_atual = 0;            // Qual dos 3 pontos do mapa o jogador acessou (0, 1 ou 2)
amostra_liberada = -1;      // Guarda o índice da amostra destravada (-1 = nenhuma ainda)
minigame_concluido = false; // Trava os controles assim que a resposta certa for atingida

// 3. Banco de Gabaritos (3 pontos de interesse, cada um com 3 opções possíveis)
// Exemplo do Ponto 0: Opção 0 = "CA MG" (Cálcio + Magnésio em ASCII binário)
// Cada letra ocupa 1 byte (8 bits). 4 letras = 32 bits exatos.
gabaritos = [
    // Ponto de Interesse 0 (Ex: CA = 01000011 01000001 | MG = 01001101 01000111)
    [
        "01000011 01000001 01001101 01000111", // Amostra 0 (Correta para este exemplo)
        "01001110 01000001 01001111 00100000", // Amostra 1
        "01001011 00100000 01001000 00100000"  // Amostra 2
    ],
    // Ponto de Interesse 1 (Preencha com os 32 bits das 3 amostras do segundo ponto)
    [
        "00000000 00000000 00000000 00000001", // Amostra 0
        "00000000 00000000 00000000 00000010", // Amostra 1
        "00000000 00000000 00000000 00000011"  // Amostra 2
    ],
    // Ponto de Interesse 2 (Preencha com os 32 bits das 3 amostras do terceiro ponto)
    [
        "11111111 00000000 00000000 00000000", // Amostra 0
        "00000000 11111111 00000000 00000000", // Amostra 1
        "00000000 00000000 11111111 00000000"  // Amostra 2
    ]
];

// Define qual das 3 opções (0, 1 ou 2) é a amostra correta de cada ponto
resposta_correta_por_ponto = [0, 1, 2];