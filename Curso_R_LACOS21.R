#Curso de Introdu��o � linguagem R - LACOS 21 - 29/05/2018

#Parte 1 - Programa��o b�sica em Linguagem R 

#A)Primeiros Passos 
  #Conhecendo o Ambiente
  #Pedindo ajuda
  #Pacotes
  #Comandos b�sicos


#Para executar no console qualquer parte desse c�digo
#Version
version

#Citation
citation() #R Core Team (2017). R: A language and environment for statistical computing. R Foundation
#for Statistical Computing, Vienna, Austria. URL https://www.R-project.org/.

#Limpar tela(limpando o console, que � essa janela abaixo), use ctrl+l 

#Verificando o diret�rio atual de trabalho
getwd()

#Definindo o diret�rio atual de trabalho
setwd()
#Listar objetos e vari�veis 
ls()

#Limpar mem�ria
rm(list=ls()) 
#apaga os objetos e vari�veis que estavam no nosso ambiente de trabalho
#d� um ls() de novo e confira!

#Pedindo ajuda 
?rm #para fun��o espec�fica
#(Perceba que essa janela do canto direito de baixo mudou)
??statistics #para uma palavra relacionada

#Instalando pacotes #swirl
install.packages("swirl") #�timo para aprender R (:
library(swirl)  #permite que o R use o pacote, tem que "chamar" quando for usar

# Comentar c�digo: Ctrl+shift+c comentamos o c�digo. Posicione o cursor nessa linha e teste! ;)
# Executar c�digo inteiro: Ctrl+shift+enter
# Cursor para o editor: ctrl+1
# Cursor para o console: ctrl+2
# Demorando a executar: ctrl+c
# Uso de tab: autocompletar!

#R funciona como uma calculadora (Operadores aritim�ticos)
3+4 #Adi��o
7*2 #Multiplica��o
5-9 #Subtra��o
8/2 #Divis�o
4**3 #Potencia��o
4^3 #Potencia��o
9%%4 #Resto de uma divis�o

#Atribui��o de valor a uma vari�vel 
# = ou <- (n�o faz diferen�a usar um ou outro,escolha!)
a<-1
a
a=2
a #veja que mudou o valor de "a", ent�o deu certo!

#B)Tipos de dados 
#Num�ricos #L�gicos #Caracteres(Strings)

#Qual o tipo de dado? 
a<-TRUE
class(a)

#Operadores l�gicos (and,not,or)

#B)Tipos de objetos no R
#Vetores #Matrizes #Fatores #Listas #Data Frame  

##1.Vetores
#Rede de restaurantes
#Imagine que voc� tenha uma rede de restaurantes e queira conferir como ficou o "balan�o"
#de caixa em uma semana
caixa<-c(47,120,-40,200,30,-100,-300)
semana<-c("Domingo","Segunda","Ter�a","Quarta","Quinta","Sexta","S�bado")
names(caixa)<-semana #Nomeando os nomes dos elementos
length(caixa) #Tamanho do vetor
caixa

#Calculando o fluxo de caixa da semana para dois restaurantes da rede
caixa1<-caixa
caixa2<-c(42,-67,400,-70,30,58,-256) 
names(caixa2)<-semana
total2rest<-caixa1+caixa2
total2rest

#Balan�o semanal por restaurante
rest1_semana<-sum(caixa1)
rest2_semana<-sum(caixa2)

#Total geral da semana
total_rede<-rest2_semana+rest1_semana

#Comparando os valores que est�o dentro do objeto (eles retornam um valor l�gico)
caixa1>caixa2
rest1_semana<=rest2_semana

#Acessando um valor #�ndice e Nome da coluna
sabado1<-caixa1[7]
sabado1
sabado2<-caixa1["S�bado"]
sabado2

#Acessando v�rios valores 
#Por �ndice
fds1<-caixa1[c(7,1)]
fds1
#Por Nome da coluna
fds2<-caixa1[c("S�bado","Domingo")]
fds2
#Por Intervalos de �ndices
uteis<-caixa1[2:6]
uteis

#Alterando o passo (usando a fun��o seq)
#Podemos alterar a varia��o dos elementos. Por padr�o, o passo � 1, ou seja, temos
#uma varia��o "1,2,3...". Se o passo � 2, teremos "1,3,5...".
uteis<-caixa1[seq(2,6,by=1)]
uteis
alguns<-caixa1[seq(1,6,by=2)]
alguns

#Dias bons #dias onde os dois restaurantes lucraram
dias_bons<-total2rest>0 
dias<- total2rest[dias_bons]
dias
dias<- total2rest[total2rest>0]

#2.Matrizes
#Criando uma matriz
m1<-matrix(3:11,nrow=3,ncol=3)
m2<-matrix(0.5:8.5,nrow=3,ncol=3)
m3<-matrix(1:6,byrow = TRUE,ncol=2)
m4<-matrix(1:6,byrow = TRUE,ncol=3)

#Verificando as dimens�es 
dim(m3) #3 linhas e 2 colunas

#Criando uma matriz
#Criar 3 vetores com valores num�ricos
celtics<-c(2.12,2.4,2.0,1.95)
lakers<-c(1.88,2.3,1.98,2.18)
bucks<-c(2.24,1.87,2.3,1.83)

#Juntar os tr�s
basquete<-c(celtics,lakers,bucks)

#Criar a matriz
m_basquete<-matrix(basquete,byrow=FALSE,ncol=3)

#Renomear colunas e linhas
colnames(m_basquete)<-c("celtics","lakers","bucks")
m_basquete
rownames(m_basquete)<-c("T1","T2","T3","T4")
m_basquete

#Selecionando valores:
View(m_basquete) #dando uma olhada na matriz
#Elemento
m_basquete[1,2]
m_basquete["T1","lakers"]
#Coluna
m_basquete[,1]
m_basquete[,"bucks"]
#Linha
m_basquete["T1",]
#Subconjunto
m_basquete[c("T1","T3"),3]


#3.Fatores
rendimento<-c("alto","m�dio","alto","baixo","baixo")
f_rendimento<-factor(rendimento)

#Definir os n�veis
f_rendimento<-factor(rendimento,ordered = TRUE,levels=c("baixo","m�dio","alto"))


#4.Listas
umvetor <- 1:10 
umamatriz<- matrix(1:9, ncol = 3)
umdataframe<- mtcars[1:10,]
lista_de_objetos<- list(umvetor,umamatriz,umdataframe)

#Nomeando cada objeto da lista
names(lista_de_objetos)<-c("um.a.10","um.a.nove","carros")

#Renomear cada um dos objetos dentro da lista
lista_de_objetos<- list(um_a_dez=umvetor,um_a_nove=umamatriz,meus_carros=umdataframe)
lista_de_objetos

#Selecionando elementos
lista_de_objetos[[1,3]]
lista_de_objetos$meus_carros[2,]

#Adicionar objeto � lista
lista_de_objetos_nova<-c(lista_de_objetos,grupo="LACOS 21 - ICBS/UFAL")


#5.Data Frames
#Qual o diret�rio atual?
getwd()

#Definindo diret�rio de trabalho
setwd("C:/Users/albuq/Desktop") #Substitua pelo caminho para a sua pasta

#Importando arquivos
dados_titanic<-read.csv("https://goo.gl/4QpYvK",sep=",",header = TRUE) 
#Aqui voc� est� adquirindo os dados diretamente da internet, mas voc� pode usar o 
#arquivo que est� no reposit�rio. Para import�-lo, ele precisa fazer o download dele e estar no diret�rio 
#onde ele est�.Lembre-se que o nome do arquivo deve conter sua extens�o; no nosso caso, 
#trabalhamos com csv. Usar�amos "titanic.csv" ao inv�s de "https://goo.gl/4QpYvK".

#Exportando arquivos
write.table(dados_titanic, file='titanic1.csv', sep=';', dec='.', row.names=FALSE)
#Lembrando que esse arquivo vai para o diret�rio atual

#Dando uma olhada em dados_titanic
head(dados_titanic, n=4)
str(dados_titanic)
View(dados_titanic)

#Ordenando dados
cidades_ord_alf<- dados_titanic[order(dados_titanic$embarked),] #ordenando strings: ficam em ordem alfab�tica
classes<- dados_titanic[order(dados_titanic$class),] #ordenando valores num�ricos

#Alterar nome de uma coluna
names(dados_titanic)
colnames(dados_titanic)[7]<-"Tarifa"

#Excluindo linhas
nrow(dados_titanic)
dados_titanic_1 <- dados_titanic[-c(1,5), ]
nrow(dados_titanic_1)

#Explorando meus dados 
#Quantas pessoas eu tenho em cada classe?
table(dados_titanic$class)

#Quantas mulheres eu tenho na terceira classe?
mulheres_3<-subset(dados_titanic,(dados_titanic$who=="woman") & (dados_titanic$class=="Third"))
mulheres_3<-subset(dados_titanic,who=="woman" & class=="Third")
nrow(mulheres_3)

#Quantas crian�as est�o viajando sozinhas?
c_sozinhas<-subset(dados_titanic,who=="child" & alone=="True")
nrow(c_sozinhas)
View(c_sozinhas)

#Quantos maiores de idade eu tenho � bordo?
maiores_idade<-subset(dados_titanic,age>=18)
nrow(maiores_idade) #601

#Qual a idade m�xima para um homem � bordo?
homens<-subset(dados_titanic,who=="man")
summary(homens$age)

#Quais s�o os dados para esse homem com a idade m�nima?
homens<- subset(homens, !is.na(homens$age))
homem_idade_m�xima<-subset(homens,homens$age==max(homens$age))

#Quantos maiores de idade eu tenho � bordo?
maiores_idade<-subset(dados_titanic,age>=18)
nrow(maiores_idade) #601

####Estat�sticas
View(dados_titanic)
quantile(dados_titanic$Tarifa)
mean(dados_titanic$Tarifa)
sd(dados_titanic$Tarifa)
var(dados_titanic$Tarifa)
median(dados_titanic$Tarifa)
min(dados_titanic$Tarifa)
max(dados_titanic$Tarifa)
range(dados_titanic$Tarifa)
summary(dados_titanic)


#Estruturas 
#Estruturas de condi��o
#O n�mero � par ou � �mpar?
n <- as.integer(readline(prompt="Digite um n�mero: ")) #Entrada de dados 
if(n%%2==0){print("� par!")}else{print("� �mpar!")}
#Selecione tudo de if at� o �ltima chave e d� um ctrl+r

#Estruturas de repeti��o
#n primeiros n�meros naturais 
#Lembrando que o zero � o primeiro n�mero natural
numero <- as.integer(readline(prompt="Digite um n�mero: "))
for(i in 0:(numero-1)){
  print(i)
}
#Selecione tudo de for at� o �ltima chave e d� um ctrl+r



