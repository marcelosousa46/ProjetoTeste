# ProjetoTeste
Projeto para avaliação de conhecimento na linguagem Delphi com PostgreeSQL
Para gerar a planinha Excel existe um botão na tela de cadastro.
configurações do banco:
=======================
   FServidor:= 'localhost';
   FPorta   := '5432';
   FBanco   := 'MV';
   FUsuario := 'postgres';
   FSenha   := '123';
estas configurações se encontram na Unit uDadosConexaoModel

dentro da estrutura de pastas ProjetoTeste\scripts
estão os scripts para criação do banco e tabelas usando PostGreeSQL
