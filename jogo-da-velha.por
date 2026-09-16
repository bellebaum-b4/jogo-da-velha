programa
{
    cadeia tabuleiro[3][3]

    funcao inicio()
    {
        inteiro linha, coluna
        cadeia jogador = "X"
        inteiro jogadas = 0
        logico venceu = falso

        mostrarRegras()

        // Inicializa o tabuleiro
        para (inteiro i = 0; i < 3; i++)
        {
            para (inteiro j = 0; j < 3; j++)
            {
                tabuleiro[i][j] = " "
            }
        }

        // Início do jogo
        enquanto (venceu == falso e jogadas < 9)
        {
            mostrarTabuleiro()

            escreva("\nJogador ", jogador, ", escolha a linha (1-3): ")
            leia(linha)

            escreva("Jogador ", jogador, ", escolha a coluna (1-3): ")
            leia(coluna)

            // Converte para a posição da matriz
            linha = linha - 1
            coluna = coluna - 1

            // Verifica se a posição é válida
            se (linha < 0 ou linha > 2 ou coluna < 0 ou coluna > 2)
            {
                escreva("\nPosição inválida! Escolha valores entre 1 e 3.\n")
            }
            senao se (tabuleiro[linha][coluna] != " ")
            {
                escreva("\nEssa posição já está ocupada! Escolha outra.\n")
            }
            senao
            {
                // Coloca o símbolo do jogador
                tabuleiro[linha][coluna] = jogador
                jogadas++

                // Verifica se o jogador venceu
                se (verificarVitoria(jogador))
                {
                    venceu = verdadeiro

                    mostrarTabuleiro()

                    escreva("\n================================\n")
                    escreva("     JOGADOR ", jogador, " VENCEU!\n")
                    escreva("================================\n")
                }
                senao
                {
                    // Troca o jogador
                    se (jogador == "X")
                    {
                        jogador = "O"
                    }
                    senao
                    {
                        jogador = "X"
                    }
                }
            }
        }

        // Verifica empate
        se (venceu == falso)
        {
            mostrarTabuleiro()

            escreva("\n================================\n")
            escreva("          DEU VELHA!\n")
            escreva("           EMPATE!\n")
            escreva("================================\n")
        }
    }


    // ==========================================
    // FUNÇÃO QUE MOSTRA AS REGRAS
    // ==========================================

    funcao mostrarRegras()
    {
        escreva("\n")
        escreva("=============================================\n")
        escreva("             JOGO DA VELHA\n")
        escreva("=============================================\n")
        escreva("\nREGRAS:\n")
        escreva("1. O jogo possui 2 jogadores: X e O.\n")
        escreva("2. O jogador X começa a partida.\n")
        escreva("3. Cada jogador escolhe uma linha e uma coluna.\n")
        escreva("4. Nao e permitido escolher uma posicao ocupada.\n")
        escreva("5. Vence quem formar uma sequencia de 3 simbolos.\n")
        escreva("6. A sequencia pode ser horizontal, vertical ou diagonal.\n")
        escreva("7. Se todas as posicoes forem preenchidas sem vencedor,\n")
        escreva("   o jogo termina empatado.\n")
        escreva("\n=============================================\n")
    }


    // ==========================================
    // FUNÇÃO QUE MOSTRA O TABULEIRO
    // ==========================================

    funcao mostrarTabuleiro()
    {
        escreva("\n")
        escreva("       TABULEIRO\n")
        escreva("\n")

        escreva("        1   2   3\n")
        escreva("      +---+---+---+\n")
        escreva("  1   | ", tabuleiro[0][0], " | ", tabuleiro[0][1], " | ", tabuleiro[0][2], " |\n")
        escreva("      +---+---+---+\n")
        escreva("  2   | ", tabuleiro[1][0], " | ", tabuleiro[1][1], " | ", tabuleiro[1][2], " |\n")
        escreva("      +---+---+---+\n")
        escreva("  3   | ", tabuleiro[2][0], " | ", tabuleiro[2][1], " | ", tabuleiro[2][2], " |\n")
        escreva("      +---+---+---+\n")
    }


    // ==========================================
    // FUNÇÃO QUE VERIFICA A VITÓRIA
    // ==========================================

    funcao logico verificarVitoria(cadeia jogador)
    {
        // Verifica as linhas
        para (inteiro i = 0; i < 3; i++)
        {
            se (tabuleiro[i][0] == jogador e
                tabuleiro[i][1] == jogador e
                tabuleiro[i][2] == jogador)
            {
                retorne verdadeiro
            }
        }

        // Verifica as colunas
        para (inteiro j = 0; j < 3; j++)
        {
            se (tabuleiro[0][j] == jogador e
                tabuleiro[1][j] == jogador e
                tabuleiro[2][j] == jogador)
            {
                retorne verdadeiro
            }
        }

        // Verifica a diagonal principal
        se (tabuleiro[0][0] == jogador e
            tabuleiro[1][1] == jogador e
            tabuleiro[2][2] == jogador)
        {
            retorne verdadeiro
        }

        // Verifica a diagonal secundária
        se (tabuleiro[0][2] == jogador e
            tabuleiro[1][1] == jogador e
            tabuleiro[2][0] == jogador)
        {
            retorne verdadeiro
        }

        // Se nenhuma condição de vitória for encontrada
        retorne falso
    }
}