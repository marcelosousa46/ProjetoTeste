inherited frmCadastroEmpregado: TfrmCadastroEmpregado
  Caption = 'frmCadastroEmpregado'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnPrincipal: TPanel
    inherited pnTop: TPanel
      inherited lbTitulo: TLabel
        Width = 187
        Height = 57
        Caption = 'Cadastro Empregados'
        ExplicitWidth = 187
      end
    end
    inherited pgListagem: TPageControl
      inherited tbListagem: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 28
        ExplicitWidth = 792
        ExplicitHeight = 386
        inherited pnMenuListagem: TPanel
          inherited pnBotoes: TPanel
            Left = 624
            Width = 168
            ExplicitLeft = 624
            ExplicitWidth = 168
            inherited btInsert: TSpeedButton
              Left = 41
            end
            inherited btExcluir: TSpeedButton
              Left = 123
              OnClick = btExcluirClick
            end
            inherited btEdit: TSpeedButton
              Left = 82
            end
            object btExportar: TSpeedButton
              Left = 0
              Top = 0
              Width = 41
              Height = 41
              Align = alLeft
              GroupIndex = 1
              Flat = True
              Glyph.Data = {
                36090000424D3609000000000000360000002800000018000000180000000100
                2000000000000009000000000000000000000000000000000000F9F6F8FFF7F5
                FBFFF5F8F5FFF7F8F5FFF8F5FAFFF9F6F9FFF8F7F9FFF6F6F7FFF7F6F7FFF7F6
                F8FFF7F6F8FFF7F6F8FFF7F6F8FFF7F6F8FFF7F6F8FFF7F6F8FFF8F7F8FFF8F6
                F8FFF9F6F7FFF6F9F4FFF5F8F6FFF8F5FAFFF8F8F4FFF5F6FAFFF8F7F7FFF6F7
                F7FFF5F7F7FF9FA69BFF748167FFF3F5F3FFEBECEBFF868686FF828382FF8484
                84FF848484FF848484FF858484FF858484FF858484FF838281FF8C8C8BFFF0F0
                F0FFBCC3BBFF5D6F4FFFC1C8C2FFF7F7F7FFF8F7F6FFF5F7F8FFF7F8F4FFF6F7
                F7FFF5F5FCFF687264FF425432FFE8EBEDFFA9ABABFFD5D7D7FF7D7F7EFFEAEC
                EBFFEAECEBFFEAECEBFFEAECEBFFEAECEBFFEAECEBFF818382FFDFE0E0FFF4F7
                F7FF5E7154FF6A9A2DFF57684EFFF6F6F9FFF8F7F7FFF5F8F5FFF7F6F9FFC3C4
                C0FFDAD9D9FFF4F4F1FFEDF0E6FFF7F7F7FFEEEFF0FFF6F7F8FF949596FFD0D1
                D2FFF6F7F8FFF6F7F8FFF6F7F8FFF6F7F8FFD0D1D2FF98989AFFF6F7F8FFF6F7
                F8FFA6AFA3FF485E39FFADB7A7FFA09EA2FFF7F6F4FFF5F7F6FFF8F7F9FFEFED
                ECFF787371FF675F5EFF69605FFF685E60FF67605EFF66605EFF625C5AFF413A
                38FF66605EFF66605EFF66615FFF65605EFF3C3735FF615C5AFF66605EFF6560
                5EFF65605EFF635F5DFF655F60FF7F7976FFF7F3F3FFF4F6F6FFF9F6F9FFAEAB
                A6FF736C63FF897B78FF8C7D73FF8C7C74FF8B7D75FF8A7C74FF8B7D75FF8A7D
                75FF8A7C75FF6F625BFF6F635CFF8A7D75FF8A7D75FF8A7E76FF897E75FF8B7E
                75FF8C7E73FF8A7D76FF887C78FF6F645DFFB4AFAFFFF4F7F6FFF9F7F7FFA39F
                9CFF7C716DFF847974FF887870FF8A7870FF867872FF877971FF887A6EFF8477
                75FF887972FF786B63FF766B64FF897872FF847972FF847972FF817A72FF8679
                72FF877971FF887871FF827A73FF7B6B66FFA3A09EFFF6F7F7FFF3F7F9FF9D9F
                9DFF7B726CFF574A43FF8D7C70FF897C6EFF927B6FFF8B7B71FF877F6CFF8E7C
                6DFF897E6BFF8A7B70FF8A7C6EFF8A7C6DFF8B7C6CFF8D7D6EFF8D7D6EFF8D7C
                6EFF8C7C6EFF8C7B6FFF524840FF7C6B66FFA2A09FFFF4F7F8FFFAF6F9FFA39E
                9EFF7A726BFF504D46FF918C83FF8F8C83FF8E8D82FF938B84FF928986FF9989
                84FF978C85FF8D8E82FF8F8B83FF988B86FF998984FF908A84FF928A84FF9789
                84FF918A83FF938A84FF4C4945FF796B68FFA3A09FFFF7F7F7FFF4F7F8FFA29F
                9CFF7A716CFF8B8A87FFF8F6F8FFF6F1F6FFFAF9FAFFF4F7F8FFF3F5F5FFFAF7
                FAFFF6F7F7FFF6F5F7FFF9F8FAFFFEFDFFFFFDFDFDFFFEFDFDFFFDFEFDFFFBFE
                FDFFFDFDFBFFFFFEFAFF848581FF786B69FFA4A09EFFF8F7F7FFFAF6F8FFA19F
                9DFF7A716DFF888A89FF3D5457FF507C81FF6A797AFF384155FF425473FF6B6E
                77FF3B5359FF537C82FF697979FFFDFDFEFFFBFEFEFFFBF9F8FFF8FDF9FFB5B1
                AEFFE1E5E7FFFCFEFFFF828585FF766A6BFFA3A09FFFFAF7F6FFF4F7F8FFA49E
                9DFF7E706EFF898A89FF7A8D92FF617F88FF9CA8ACFF7F8797FF697490FFA2A4
                AFFF788B95FF628085FF9BA9A9FFFFFCFDFFD3D2D0FF644843FFB4A29BFF4E36
                31FF95918EFFFFFEFCFF868683FF776A69FFA2A09FFFF7F7F8FFFBF7F7FF9EA0
                9BFF79726CFF8A8989FF243D45FF396B75FF51686BFF1F2A45FF2A3C6FFF5858
                6CFF233D46FF396B77FF55686AFFFDFDFEFFF2ECEEFF745244FF894F3AFFB8A9
                A4FFFCFDFCFFFCFEFEFF878582FF726C67FFA0A19FFFFCF4FBFFF5F6FBFFA19F
                9EFF79726CFF8C8B88FF919498FF79848CFFADB1B1FF929499FF7D8289FFB0AE
                B2FF8C9994FF7A8489FFADB0B3FFF6FEFDFFFAFEFCFFE6E1E4FF784A44FF8F4E
                3CFFBDAEABFFFDFDFCFF8A8483FF796B68FFA3A09EFFF7F6F9FFF7F8F7FFA3A0
                9AFF7E726AFF8A8989FF1F3840FF2E5C68FF52626BFF1B273FFF253460FF5157
                6BFF203840FF305A6BFF53626AFFFCFEFCFFFDFDFCFF9A8E8FFF7F6C6AFF7351
                45FF66443FFFF9F7F5FF858686FF756B6AFFA1A19EFFF3F8F7FFF2F8F9FFA09E
                9EFF7B706FFF888989FF839698FF6A898EFFA7AEB5FF88929CFF738091FFA8AD
                B7FF87959BFF6F868EFFA6ADB7FFFDFDFCFFFFFEFBFF958E8BFF8E8B7DFFF0EB
                EDFFC5C0BBFFF9FEFBFF858585FF7B696AFFA7A09DFFF6F8F6FFFDF7F6FFA2A0
                9BFF78726CFF8B898AFF2C3C45FF375B68FF586A6DFF2A2D41FF2D3763FF575F
                6CFF283E44FF345E67FF5A686EFFF7FEF9FFFEFBFEFFFBFEFEFFFCFFF9FFFFFD
                FEFFFEFEFCFFFBFEFEFF848584FF746B68FFA0A19EFFF7F7F7FFF3F7F9FFA39F
                9CFF7B716CFF5C5B56FF999A97FF989798FF9F9B9CFF989C96FF989797FF9F9D
                9BFFA09A97FF999798FF9D9D9CFFA4A3A4FFA6A2A4FF9FA4A2FFA6A5A1FFA4A4
                A4FFA2A4A4FFA3A3A3FF5D5554FF766C66FFA0A29CFFF8F6F9FFF7F6F9FFB7B1
                B1FF6A625EFF756B65FF726865FF716866FF736964FF736C5FFF746668FF7468
                65FF746963FF736963FF736A64FF726963FF746964FF726963FF736963FF7269
                63FF716A63FF716963FF76696AFF665E53FFBFBCB7FFF4F6FBFFF5F8F8FFF3F3
                F3FFA7A4A2FF8D8986FF8C8985FF898885FF878485FF8C8987FF8E8987FF8E87
                87FF8D8787FF8C8886FF8C8786FF8D8887FF8D8887FF8D8887FF8D8887FF8D87
                87FF8E8789FF8D8B86FF8C8788FFADA5ABFFF9F5F7FFF6F7F8FFF4F8F5FFF5F7
                F6FFF7F6F8FFABABABFFF5F8F4FF788074FF4B5C3BFFECF1EDFFF5F7F6FFF6F8
                F6FFF6F8F5FFF5F6F8FFE9EAEBFFB0B0B1FFF6F7F8FFF6F7F8FFF6F7F8FFF6F6
                F8FFF0F0F0FF848E80FFAAB4A9FFF5F7F7FFF9F6F7FFF8F8F4FFF7F8F6FFF7F7
                F7FFF9F5F9FFEFEEEFFFF6F8F6FF90958BFF536447FFEFF4F1FFF5F7F7FFAAAA
                AAFFF8F8F7FFF7F6F9FFF6F6F6FFEEEEEEFFF8F7F7FFF7F7F6FFF3F3F3FFA7A7
                A6FFB5BCB1FF5C7E2DFF36501DFFF3F9F4FFF8F7F7FFF9F8F4FFF9F6F8FFF8F7
                F8FFF8F7F7FFF8F7F7FFF7F7F7FFF7F7F7FFF3F4F8FFF6F6F8FFF7F6F6FFEEEC
                EEFFF8F6F9FFF7F6F7FFF8F7F6FFF8F8F7FFF8F7F6FFF8F7F6FFF8F7F7FFECEB
                EBFFE5E8E6FF647456FF8B9783FFF5F9F4FFF8F5FBFFF7F5FCFFF7F6FAFFF6F7
                F7FFF6F8F6FFF5F8F4FFF5F7F7FFF6F6F9FFF7F8F7FFF7FAF1FFF9F5FBFFF9F7
                F7FFF7F8F5FFF6F8F6FFF7F7F8FFF7F6F8FFF7F6F8FFF7F6F8FFF7F6F8FFF7F7
                F8FFF7F7F5FFF6F5F9FFF7F6F7FFFAF8F4FFF8F7F6FFF5F9F4FF}
              Margin = 5
              Spacing = 10
              OnClick = btExportarClick
              ExplicitLeft = 8
            end
          end
        end
        inherited pnGrid: TPanel
          inherited dbgDados: TDBGrid
            DataSource = DM.dsEmpregados
            Columns = <
              item
                Expanded = False
                FieldName = 'id_empregado'
                Title.Caption = 'ID'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nm_empregado'
                Title.Caption = 'Nome'
                Width = 312
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nm_funcao'
                Title.Caption = 'Fun'#231#227'o'
                Width = 309
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'data_admissao'
                Title.Caption = 'Admiss'#227'o'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'salario'
                Title.Caption = 'Sal'#225'rio'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nm_departamento'
                Title.Caption = 'Departamento'
                Width = 95
                Visible = True
              end>
          end
        end
      end
      inherited tbCadastro: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 28
        ExplicitWidth = 792
        ExplicitHeight = 386
        object Label1: TLabel [0]
          Left = 7
          Top = 98
          Width = 39
          Height = 17
          Caption = 'Nome:'
        end
        object Label2: TLabel [1]
          Left = 7
          Top = 66
          Width = 87
          Height = 17
          Caption = 'Departamento:'
        end
        object Label3: TLabel [2]
          Left = 7
          Top = 138
          Width = 44
          Height = 17
          Caption = 'Fun'#231#227'o:'
        end
        object Label4: TLabel [3]
          Left = 7
          Top = 173
          Width = 90
          Height = 17
          Caption = 'Data admiss'#227'o:'
        end
        object Label5: TLabel [4]
          Left = 7
          Top = 210
          Width = 43
          Height = 17
          Caption = 'Sal'#225'rio:'
        end
        object Label6: TLabel [5]
          Left = 7
          Top = 247
          Width = 60
          Height = 17
          Caption = 'Comiss'#227'o:'
        end
        inherited Panel1: TPanel
          TabOrder = 5
        end
        object edNome: TEdit
          Left = 99
          Top = 98
          Width = 531
          Height = 25
          TabOrder = 0
        end
        object dblDepartamento: TDBLookupComboBox
          Left = 99
          Top = 59
          Width = 531
          Height = 25
          DataField = 'id_departamento'
          DataSource = DM.dsEmpregados
          KeyField = 'id_departamento'
          ListField = 'nm_departamento'
          ListSource = DM.dsDepartamentos
          TabOrder = 6
        end
        object edFuncao: TEdit
          Left = 99
          Top = 134
          Width = 531
          Height = 25
          TabOrder = 1
        end
        object dtDataAdimissao: TDateTimePicker
          Left = 99
          Top = 168
          Width = 186
          Height = 25
          Date = 44607.000000000000000000
          Time = 0.386262222222285300
          TabOrder = 2
        end
        object edSalario: TEdit
          Left = 99
          Top = 205
          Width = 186
          Height = 25
          Alignment = taRightJustify
          TabOrder = 3
          Text = '0'
          OnExit = edSalarioExit
        end
        object edComissao: TEdit
          Left = 99
          Top = 242
          Width = 186
          Height = 25
          Alignment = taRightJustify
          TabOrder = 4
          Text = '0'
          OnExit = edComissaoExit
        end
      end
    end
  end
end
