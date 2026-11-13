esta branch se trata da implementação de uma impressora térmica que ficara acoplada ao computador (que roda o jogo)e fará com que cada vez que o jogador descubra uma área nova, seja impressa feito uma folha com dicas referente ao que eles tem que fazer e onde devem ir por meio de um sistemas de coordenadas cartesiano.


A ideia é primeiro fazer uma varredura em todos os "pontos de interesse" no mapa, associa-los a algo palpável para o jogador e criar um arquivo .TXT que depois será lido por um script em Python que vai manda-lo para a impressão.

no atual momento, quando o jogador entra em uma room que tem informações relevantes o jogo (se ainda não tiver feito) cria ou edita um arquivo TXT(nomeada "pontos_interesse") diretamente na pasta Downloads, e a edita conforme a necessidade!
