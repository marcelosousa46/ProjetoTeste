unit uDadosConexaoModel;

interface

type

  TDadosConexao = class
  private
    FUsuario: string;
    FServidor: string;
    FSenha: string;
    FPorta: string;
    FBanco: string;
  public
    property Servidor: string read FServidor write FServidor;
    property Porta: string read FPorta write FPorta;
    property Banco: string read FBanco write FBanco;
    property Usuario: string read FUsuario write FUsuario;
    property Senha: string read FSenha write FSenha;

    procedure CarregarInformacoes;
  end;

implementation

{ TDadosConexap }

procedure TDadosConexao.CarregarInformacoes;
begin
   {
     Ideal aqui seria pegar as informações talve de um .INI
     Mais devido ao tempo para desenvolvimento vou deixar hard
   }
   FServidor:= 'localhost';
   FPorta   := '5432';
   FBanco   := 'MV';
   FUsuario := 'postgres';
   FSenha   := '123';

end;

end.
