Script completo de transformação dos dados:

let
    Fonte = Csv.Document(
        File.Contents("C:\Users\vgagl\Downloads\preprocessed_trendedpointalarm 1.csv"),
        [Delimiter=",", Columns=15, Encoding=1252, QuoteStyle=QuoteStyle.None]
    ),
    #"Cabeçalhos Promovidos" = Table.PromoteHeaders(Fonte, [PromoteAllScalars=true]),
    #"Tipo Alterado" = Table.TransformColumnTypes(
        #"Cabeçalhos Promovidos",
        {
            {"DateTime", type datetime},
            {"ProcessID", type text},
            {"AssetID", type text},
            {"AlarmSeverityName", type text},
            {"State", type text},
            {"TransactionMessage", type text},
            {"Stage", type text},
            {"AlarmClassName", type text},
            {"Year", Int64.Type},
            {"Month", Int64.Type},
            {"Day", Int64.Type},
            {"DayOfWeek", type text},
            {"Season", type text},
            {"Hour", Int64.Type},
            {"ProcessedMessage", type text}
        }
    ),
    #"Dividir Coluna por Delimitador" =
        Table.SplitColumn(
            Table.TransformColumnTypes(#"Tipo Alterado", {{"DateTime", type text}}, "pt-BR"),
            "DateTime",
            Splitter.SplitTextByDelimiter(" ", QuoteStyle.None),
            {"DateTime.1", "DateTime.2"}
        ),
    #"Tipo Alterado1" = Table.TransformColumnTypes(
        #"Dividir Coluna por Delimitador",
        {{"DateTime.1", type date}, {"DateTime.2", type time}}
    ),
    #"Colunas Renomeadas" = Table.RenameColumns(
        #"Tipo Alterado1",
        {{"DateTime.1", "Data"}, {"DateTime.2", "Hora"}}
    ),
    #"Dividir Coluna por Delimitador1" =
        Table.SplitColumn(
            #"Colunas Renomeadas",
            "TransactionMessage",
            Splitter.SplitTextByDelimiter(" ", QuoteStyle.None),
            {"TransactionMessage.1", "TransactionMessage.2", "TransactionMessage.3", "TransactionMessage.4"}
        ),
    #"Tipo Alterado2" = Table.TransformColumnTypes(
        #"Dividir Coluna por Delimitador1",
        {
            {"TransactionMessage.1", type text},
            {"TransactionMessage.2", type text},
            {"TransactionMessage.3", type text},
            {"TransactionMessage.4", type text}
        }
    ),
    #"Colunas Mescladas" =
        Table.CombineColumns(
            #"Tipo Alterado2",
            {"TransactionMessage.2", "TransactionMessage.3", "TransactionMessage.4"},
            Combiner.CombineTextByDelimiter(" ", QuoteStyle.None),
            "Mesclado"
        ),
    #"Colunas Removidas" =
        Table.RemoveColumns(
            #"Colunas Mescladas",
            {"Stage", "AlarmClassName", "State", "ProcessedMessage"}
        ),
    #"Colunas Renomeadas1" =
        Table.RenameColumns(
            #"Colunas Removidas",
            {{"Mesclado", "Type_of_alarm"}}
        ),
    #"Colunas Removidas1" =
        Table.RemoveColumns(#"Colunas Renomeadas1", {"AssetID", "TransactionMessage.1"}),
    #"Duplicatas Removidas" =
        Table.Distinct(#"Colunas Removidas1", {"ProcessID"}),
    #"Colunas Reordenadas" =
        Table.ReorderColumns(
            #"Duplicatas Removidas",
            {"ProcessID", "Data", "Hora", "AlarmSeverityName", "Type_of_alarm", "Year", "Month", "Day", "DayOfWeek", "Season", "Hour"}
        ),
    #"Valor Substituído" =
        Table.ReplaceValue(
            #"Colunas Reordenadas",
            "Central Battery System-Medium",
            "Central Battery ",
            Replacer.ReplaceText,
            {"AlarmSeverityName"}
        ),
    #"Valor Substituído1" =
        Table.ReplaceValue(
            #"Valor Substituído",
            "Central Battery ",
            "Batterry",
            Replacer.ReplaceText,
            {"AlarmSeverityName"}
        )
in
    #"Valor Substituído1"
