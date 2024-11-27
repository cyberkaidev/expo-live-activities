# Expo + Live Activities

Doc para mostrar como criar um Live Activities e fazer ele se comunicar com o Expo (React Native)\
Inicialmente vamos criar as pastas e arquivos e depois vamos colocar os códigos.
![0](https://i.imgur.com/Z1nbd8r.png)

Antes de tudo, vamos iniciar criando nosso projeto e fazer o prebuild somente pra ios:
```bash
yarn create expo-app --template blank-typescript
yarn install
yarn expo prebuild --platform ios
```

## Etapa 1 (Criações das pontes):

Vamos abrir a pasta ios pelo xcode.\
Ao abrir é de extrema importando deixar a IDE indexar por completo o projeto:
![1](https://i.imgur.com/TyNEYCN.png)

Vamos criar dois arquivos na pasta myapp:\
myapp (projeto) > myapp (pasta) > (clica no botão direito) > New File from Template..

Primeiro vamos criar o arquivo "MatchesLiveModule" selecionando o "Swift File"
![2](https://i.imgur.com/R653l0j.png)

![3](https://i.imgur.com/XkllSzq.png)

Agora vamos criar o arquivo "MatchesLiveHeader" selecionando o "Objective-C File"
![4](https://i.imgur.com/LbWDDtk.png)

## Etapa 2 (Configuração):

No Info.plist vamos adicionar uma propriedade que é "NSSupportsLiveActivities" com o valor "TRUE"
![5](https://i.imgur.com/cCLj7QN.png)

Após isso vamos alterar a versão iOS para a versão mais recente, no meu caso 18.0 para evitar problema de compatibilidade de versão com o Live
![6](https://i.imgur.com/FV6BfYV.png)

## Etapa 3 (Target):

Vá para o menu (barra de status do mac) e clique: File > New > Target...\
Selecione a opção "Widget Extension" e clique em "Next"
![7](https://i.imgur.com/170HOOQ.png)

Vamos deixar apenas a primeira opção marcada e por o nome de "MatchesLive".\
Fazendo isso vai abrir um modal pergutando se deseja ativar o scheme, então vamos clicar em "Activate"
![8](https://i.imgur.com/HmeVjjf.png)

![9](https://i.imgur.com/RSYqFKo.png)

Finalizando tudo isso, sua estrutura estará assim:
![10](https://i.imgur.com/EyuOT0Z.png)

## Etapa 4 (Configuração finais):

Algo muito importando que você precisa se atentar é clicar no arquivo "MatchesLiveLiveActivity" e verificar o "Target Membership" que fica na barra direita\
Pois provavelmente só deve estar selecionado o seu Target, então vamos clicar no icone de "+" e selcionar o seu projeto também e salvar
![11](https://i.imgur.com/yonDnmT.png)

Fazemos isso para que seu arquivo criado lá na etapa 1, o "MatchesLiveModule" tenha visibilidade do seu Target.

Agora vamos adicioinar 3 imagens no nosso Target para que possamos usar no nosso Widget
![12](https://i.imgur.com/kmeJsfn.png)

## Etapa 5 (Consideração final):

Antes de rodar o projeto, não esqueça de selecionar o projeto
![13](https://i.imgur.com/uE8MSmp.png)

## Etapa 6 (Copiar e colar):

Com a permissão data e estrutua criada, vamos adicionar os códigos de fato e honestamente, chega de mais imagens, agora você irá na pasta ios desse projeto e irá copiar e colar os códigos dos arquivos para seu projeto com os arquivos correspondentes e pronto, é só rodar.\
Os aquivos que você irá copiar e colar são:
- MatchesLiveHeader.m
- MatchesLiveModule.swift
- MatchesLiveLiveActivity.swift
- MatchesLiveBundle.swift
- App.tsx

Você deve estar se perguntando: Pô, mas não vai explicar ao menos um pouco do código?\
Sobre isso, relaxa, eu adicionei comentários em determinados trechos explicando o que cada coisa faz.

Você também pode clonar esse projeto e rodar ele na sua maquina, basta usar esses comandos:
```bash
yarn install
cd ios
pod install
```

Para conhecer mais sobre essa feature do iOS, você ler essa documentação da Apple:\
https://developer.apple.com/documentation/activitykit/displaying-live-data-with-live-activities