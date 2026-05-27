Kronikker
(Scroll down for the Portuguese version / Desça para a versão em Português)

A 2D platformer with time-manipulation mechanics, developed with GameMaker Studio 2.

This game was created to explore complex programming architectures while delivering a meaningful social message about mental health.

Academic Context
This project was developed during my 2nd year of High School at Colégio Embraer, serving as the final capstone project for the Exact Sciences track (Projeto Abrangente). I was solely responsible for the game's programming and codebase.

Alongside the game's source code, I co-authored a scientific article and a presentation banner detailing our research and development process. These academic materials can be accessed via my LinkedIn profile (linked on my GitHub profile).

Social Objective: Portraying Anxiety (GAD)
The core objective of Kronikker is to portray the psychological experience of Generalized Anxiety Disorder (GAD / TAG).

To translate this state into gameplay, the game features a Time-Rewind mechanic. Just as anxiety often involves overthinking and an obsessive desire to undo past actions or mistakes, the player must constantly rewind time to navigate hazards, solve puzzles, and survive. The gameplay loop forces the player to manage their limited rewind capabilities while dealing with a hostile, stressful environment.

Technical Highlights
Despite being a high school project, the codebase utilizes advanced software engineering patterns to ensure performance and scalability:

Optimized Time-Rewind System (Memory Leak Prevention): Instead of relying on vulnerable global frame indexing, the rewind system uses a strict Stack (LIFO) data structure (via array_push and array_pop). This delegates memory management natively to GameMaker's Garbage Collector, completely preventing memory leaks and game crashes during long sessions.

Finite State Machines (FSM): Player and enemy logic is strictly segregated into robust state machines (idle, moving, dash, attack, etc.), preventing nested if-else spaghetti code and allowing for easy mechanic expansion.

Advanced Game Feel and Juice:

Coyote Time and Jump Buffering: Forgiving input parsing that makes platforming feel responsive and fair.

Squash and Stretch: Dynamic sprite scaling (xscale and yscale) based on movement vectors (jumping, dashing, wall-jumping) to give weight and impact to the protagonist's actions.

How to Run
Clone this repository.

Open the project in GameMaker Studio 2.

Press F5 to compile and run.

Kronikker (Versão PT-BR)
Um jogo de plataforma 2D focado em mecânicas de manipulação temporal, desenvolvido no GameMaker Studio 2.

Este projeto foi criado para explorar arquiteturas complexas de programação ao mesmo tempo em que transmite uma mensagem social importante sobre saúde mental.

Contexto Acadêmico
Este projeto foi desenvolvido durante o meu 2º ano do Ensino Médio no Colégio Embraer, como parte da entrega final da trilha de Exatas, conhecida como Projeto Abrangente. Fui o responsável por toda a programação e desenvolvimento do código do jogo.

Em conjunto com o código-fonte, também foi produzido um artigo científico e um banner acadêmico detalhando todo o processo de pesquisa e desenvolvimento. Você pode conferir esses materiais no meu perfil do LinkedIn (disponível no meu perfil do GitHub).

Objetivo Social: Retratar a Ansiedade (TAG)
O objetivo de Kronikker é retratar a experiência psicológica do Transtorno de Ansiedade Generalizada (TAG).

Para traduzir esse estado para a gameplay, o jogo utiliza uma mecânica de voltar no tempo (Rewind). Assim como a ansiedade frequentemente envolve o overthinking (pensar demais) e o desejo obsessivo de desfazer ações ou erros do passado, o jogador precisa constantemente voltar no tempo para evitar perigos e resolver quebra-cabeças. O ciclo de jogo força o jogador a gerenciar sua energia limitada enquanto lida com um ambiente hostil e estressante.

Destaques Técnicos
Apesar de ter nascido como um projeto escolar, o código utiliza padrões avançados de engenharia de software para garantir escalabilidade e performance:

Sistema de Rewind Otimizado (Prevenção de Memory Leak): Em vez de usar um índice global de frames, o sistema de volta no tempo utiliza uma estrutura de dados de Pilha/Stack (LIFO) (utilizando array_push e array_pop). Isso delega o gerenciamento de memória nativamente ao Garbage Collector do GameMaker, prevenindo vazamentos de memória (Memory Leaks) e travamentos.

Máquinas de Estados Finitos (FSM): A lógica do jogador e dos inimigos é estritamente dividida em estados (parado, movendo, dash, ataque), evitando código espaguete e facilitando a adição de novas mecânicas.

Game Feel e Juice:

Coyote Time e Jump Buffering: Sistemas de tolerância de input que tornam os controles de plataforma responsivos e justos.

Squash and Stretch: Escalonamento dinâmico de sprites (xscale e yscale) baseado nos vetores de movimento (pulos, dashes e wall-jumps) para dar peso e fluidez às ações do protagonista.

Como Executar
Clone este repositório.

Abra o projeto no GameMaker Studio 2.

Pressione F5 para compilar e rodar.
