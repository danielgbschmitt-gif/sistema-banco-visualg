algoritmo "SistemaBanco"
var
   vazio, r, nome: caractere
   nomes: vetor [1..10] de caractere
   opcao, dep, i, c, senha, j, cont: inteiro
   senhas: vetor [1..10] de inteiro
   deposito, saque, saldo, transferencia: real
   extrato, saldos: vetor [1..10] de real
   corr, trocou: logico

procedimento mostramenu ()
inicio
   escreval ("1 - Depositar ")
   escreval ("2 - Sacar ")
   escreval ("3 - Ver extrato ")
   escreval ("4 - Transferência ")
   escreval ("5 - Trocar usuário ")
   escreval ("6 - Sair ")
fimprocedimento

procedimento fazdeposito ()
inicio
   repita
      limpatela
      escreval ("---------------------------")
      escreval ("      BANCO ITACAIXA       ")
      escreval ("        DEPOSITOS          ")
      escreval ("Saldo Atual: R${", saldos[cont]:4:2, "} ")
      escreval ("---------------------------")
      escreval ("Quanto você quer depositar, ", nomes[cont], "? ")
      leia (deposito)
      escreval ("DEPÓSITO EXECUTADO COM SUCESSO! ")
      dep <- dep + 1
      extrato[dep] <- deposito
      saldos[cont] <- saldos[cont] + deposito
      escreval ()
      escreval ("Seu novo saldo agora é R${", saldos[cont]:4:2, "} ")
      escreval ()
      escreval ("Gostaria de fazer outro depósito? [S/N] ")
      leia (r)
      r <- maiusc(r)

      enquanto (r <> "N") e (r <> "S") faca
         escreval ("Resposta Inválida! Quer continuar? [S/N] ")
         leia (r)
         r <- maiusc(r)
      fimenquanto

   ate (r = "N")
fimprocedimento

procedimento fazsaque ()
inicio
   repita
      escreval ("---------------------------")
      escreval ("      BANCO ITACAIXA       ")
      escreval ("          SAQUES           ")
      escreval ("Saldo Atual: R${", saldos[cont]:4:2, "} ")
      escreval ("---------------------------")
      escreval ("Quanto você quer sacar ", nomes[cont], "? ")
      escreval ("AVISO! O SAQUE NÃO PODE SER MAIOR QUE O SEU SALDO! ")
      leia (saque)
      enquanto (saque > saldos[cont]) ou (saque <= 0) faca
         escreval ("Saque inválido! Seu saque deve ser menor que o saldo: ")
         leia (saque)
      fimenquanto

      dep <- dep + 1
      extrato[dep] <- -saque
      saldos[cont] <- saldos[cont] - saque

      escreval ()

      escreval ("SAQUE EFETUADO COM SUCESSO! ")

      escreval ()

      escreval ("Seu novo saldo agora é R${", saldos[cont]:4:2, "} ")

      escreval ()

      escreval ("Deseja efetuar mais um saque ", nomes[cont], "? [S/N] ")
      leia (r)
      r <- maiusc(r)

      enquanto (r <> "S") e (r <> "N") faca
         escreval ("Resposta Inválida! Deseja efetuar outro saque? [S/N] ")
         leia (r)
         r <- maiusc(r)
      fimenquanto

   ate (r = "N")
fimprocedimento

procedimento mostraextrato ()
inicio
   limpatela
   escreval ("---------------------------")
   escreval ("      BANCO ITACAIXA       ")
   escreval ("    EXTRATO DE ", maiusc(nomes[cont]))
   escreval ("---------------------------")
   escreval ()
   se (dep = 0) entao
      escreval ("NENHUM SAQUE NEM DEPÓSITO FORAM EFETUADOS ")
   senao
      para i <- 1 ate dep faca
         escreva (i, " - ")
         se (extrato[i] > 0) entao
            escreval ("Depósito: R$", extrato[i]:4:2)
         senao
            escreval ("Saque: R$", extrato[i]:4:2)
         fimse
      fimpara
   fimse
   escreval ()

   escreval ("Aperte ENTER para sair... ")
   leia (vazio)
fimprocedimento

procedimento saida ()
inicio
   escreval ("---------------------- ")
   escreval ("    BANCO ITACAIXA     ")
   escreval ("---------------------- ")
   escreval ()
   escreval ("Quando precisar mexer com dinheiro, fale com o BANCO ITACAIXA! ")
   escreval ()
   escreval ("Saindo... ")
fimprocedimento

funcao login () : logico
var
   correto: logico
inicio
   correto <- falso

   limpatela
   escreval ("---------------")
   escreval ("|    LOGIN    |")
   escreval ("---------------")
   escreva ("Nome de usuário: ")
   leia (nome)
   escreva ("Senha: ")
   leia (senha)

   escreval ()

   para c <- 1 ate 10 faca
      se (nome = nomes[c]) e (senha = senhas[c]) entao
         correto <- verdadeiro
      fimse
   fimpara

   retorne correto
fimfuncao

procedimento faztransferencia ()
var
   q: inteiro
   nomet: caractere
inicio
   escreval ("---------------------------")
   escreval ("      BANCO ITACAIXA       ")
   escreval ("          SAQUES           ")
   escreval ("Saldo Atual: R${", saldos[cont]:4:2, "} ")
   escreval ("---------------------------")
   escreval ("Pra quem você desejaria fazer a transferência? ")
   escreval ("[Digite o nome de usuário dessa pessoa] ")
   leia (nomet)
   escreval ()
   para q <- 1 ate 10 faca
      se (nomet = nomes[q]) entao
         escreval ("Quanto você quer transferir para essa pessoa? ")
         leia (transferencia)
         enquanto (transferencia > saldos[cont]) ou (transferencia <= 0) faca
            escreval ("Transferência inválida! Digite novamente: ")
            leia (transferencia)
         fimenquanto
         saldos[q] <- saldos[q] + transferencia
         saldos[cont] <- saldos[cont] - transferencia
      fimse
   fimpara
fimprocedimento

procedimento trocarusuario()
inicio
   escreval ("---------------------- ")
   escreval ("    BANCO ITACAIXA     ")
   escreval ("---------------------- ")
   escreval ()
   escreval ("Você está sendo redirecionado para a tela de login... ")
   escreval ("Presione ENTER para continuar ")
   leia (vazio)
fimprocedimento

inicio
   dep <- 0
   cont <- 0
   trocou <- verdadeiro

   enquanto (trocou = verdadeiro) faca
      limpatela
      cont <- cont + 1
      escreval ("------------------")
      escreval ("|    CADASTRO    |")
      escreval ("------------------")
      escreva ("Nome de usuário: ")
      leia (nome)
      nomes[cont] <- nome
      escreva ("Saldo: ")
      leia (saldo)
      saldos[cont] <- saldo
      escreva ("Senha: ")
      leia (senha)
      senhas[cont] <- senha

      corr <- login()

      se (corr = falso) entao
         repita
            escreval ("Seu nome ou senha estão errados! ")
            escreval ("Pressione ENTER para continuar... ")
            leia (vazio)
            corr <- login()
         ate (corr = verdadeiro)
      fimse

      se (corr = verdadeiro) entao
         repita
            se (trocou = verdadeiro) entao
               limpatela
               escreval ("---------------------------------")
               escreval ("BANCO ITACAIXA ")
               escreval ("{R$", saldos[cont]:4:2, "}")
               escreval ()
               escreval ("Olá, ", nomes[cont], "!")
               escreval ("Oque você gostaria de fazer hoje? ")

               escreval ()

               mostramenu ()

               escreval ("---------------------------------")

               leia (opcao)

               enquanto (opcao < 1) ou (opcao > 6) faca
                  escreval ("Não há essa opção, ", nomes[cont], ". Digite novamente ")
                  leia (opcao)
               fimenquanto

               limpatela

               escolha (opcao)

               caso 1
                  fazdeposito()
               caso 2
                  fazsaque()
               caso 3
                  mostraextrato()
               caso 4
                  faztransferencia()
               caso 5
                  trocarusuario()
               caso 6
                  saida()
                  trocou <- falso
               fimescolha
            fimse

         ate (opcao = 5)
      fimse
   fimenquanto
fimalgoritmo