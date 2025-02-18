# Definições sobre o projeto.

## Organização:
- Pasta helper: programas para ajudar no design do jogo
- Pasta sprites: sprites e imagens do jogo
- Pasta test: pasta para a criação e execução de testes (usando FPGRARS)
- Pasta src: código fonte do jogo

### Sobre o código:

Organização das pastas em src tem o objetivo de separar ao máximo as funcionalidades do jogo.
- Pasta data: memória de dados para diferentes partes do programa
- Pasta util: macros e constantes úteis para diferentes partes do programa
- Pasta audio: arquivos para geração de áudio do jogo
- Pasta logic: programas de cálculo lógico do jogo (movimentação, habilidades, combate, IA oponente)
- Pasta video: programas para renderização gráfica do jogo

Todas as pastas devem possuir um arquivo pasta.s, que reúne os arquivos da pasta em um único e junta as funcionalidades para facilitar o processo de montagem e também gerar maior abstração

O arquivo game.s deve incluir todos os componentes do jogo e controlar a execução

### Sobre os dados:
- map_data.s guarda os mapas em si
- map_info.s guarda as informações relativas aos mapas/fases

### Sobre testes:

Para testar, crie um arquivo incluindo apenas os módulos necessários para o teste. Normalmente, src/data/data.s, src/util/util.s e src/pasta/pasta.s (de acordo com a pasta do tipo de teste).

## Design

### Máquina de estados do jogo:
- INIT: estado de configuração inicial do jogo.
- CONFIG: estado de configuração de uma fase
- ACTION: estado para ações do jogador (jogo em si)
- OVER: fim do jogo com vitória do jogador

Transições são baseadas de acordo com o estado atual e as flags PLAYER_ALIVE (está vivo?) e PLAYER_WIN (ganhou a fase atual?)

### Fases:
- Mapa Wx10 (W variável, provavelmente por volta de 40)
- 4 tipos de tile: fundo, bloco, proibido e porta
- 3 tipos de inimigos: corredor, atirador e chefão

### Vídeo:
- Tiles 16x16 (tela de 20x15 tiles)
- Menu de 80 pixels, deixando a tela com 320x160 (20x10 tiles)
- Personagens vistos em pé e alinhados com o chão
