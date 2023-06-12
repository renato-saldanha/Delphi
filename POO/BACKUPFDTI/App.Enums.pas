unit App.Enums;

interface

uses
  Fontdata.Utils;

type
  [Enumeration(TEnumType.etString, ', S, N', 'Todos, Ativo, Inativo')]
  TAtivo= (scTodos, scAtivo, scInativo);

  TTipoPersistencia = (tpInsert, tpUpdate);

  [Enumeration(TEnumType.etInteger, '0, 1, 2, 3, 4, 5', 'Todos, 01, 02, 03, 04, 05')]
  TLimiteDiasPesquisa = (ldpTodos, ldp01, ldp02, ldp03, ldp04, ldp05);

  [Enumeration(TEnumType.etInteger, '0, 1, 5, 10, 20, 25', 'Todos, 01 kilobyte, 05 kilobyte, 10 kilobyte, 20 kilobyte, 25 kilobyte')]
  TLimiteTamanhoPesquisa = (ltpTodos, ltp01kb, ltp05kb, ltp10kb, ltp20kb, ltp25kb);

  [Enumeration(TEnumType.etInteger, '1, 2, 3, 4, 5', '01, 02, 03, 04, 05')]
  TLimiteDias = (ld01, ld02, ld03, ld04, ld05);

  [Enumeration(TEnumType.etInteger, '1, 5, 10, 20, 25', '01 kilobyte, 05 kilobyte, 10 kilobyte, 20 kilobyte, 25 kilobyte')]
  TLimiteTamanho = (lt01kb, lt05kb, lt10kb, lt20kb, lt25kb);
implementation

end.
