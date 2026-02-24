## 📊 Alarmes Operacionais — Data Insights & BI

Projeto de análise de alarmes industriais com foco na identificação de padrões críticos, redução de ruído operacional e geração de insights estratégicos para manutenção e tomada de decisão.

Transformação de dados brutos → ETL estruturado → Modelagem analítica → Dashboard executivo.

## 🎯 Objetivo

Analisar registros históricos de alarmes industriais para:

Identificar padrões temporais

Detectar concentração de severidades críticas

Avaliar possíveis correlações com ciclos operacionais

Apoiar estratégias de manutenção preventiva

Reduzir impacto operacional e downtime

## 📂 Fonte de Dados

Dataset público disponível no Kaggle:

Industrial Alarm Monitoring Dataset (2018–2024)
https://www.kaggle.com/datasets/sudhanvahg/industrial-alarm-monitoring-dataset-2018-2024

## 🏗️ Estrutura do Projeto
Alarmes_Operacionais/
│
├── DashBoard/
│   └── print3.png
│
├── PowerQuery/
│   └── ScriptM.lua
│
├── Dados/
│
└── README.md

Camadas do projeto:

Raw → Dataset original Kaggle

Transformação (ETL) → Power Query (M)

Modelagem → Estrutura otimizada para análise temporal

Consumo → Dashboard Power BI

## 🛠️ ETL & Tratamento de Dados

Principais transformações aplicadas:

Promoção de cabeçalhos

Padronização de tipos de dados

Separação de Data e Hora

Extração estruturada do tipo de alarme

Remoção de colunas irrelevantes

Deduplicação por ProcessID

Tratamento de inconsistências textuais

Padronização de categorias

✔ 13.340 alarmes tratados após limpeza
✔ Estrutura pronta para análise temporal e categórica

## 🧼 Script Completo — Power Query (M)

[ScriptM.lua — Power Query](./PowerQuery/ScriptM.lua)


## 📊 Dashboard — Análise Estratégica

![Dashboard Print](./DashBoard/print3.png)

## 🔎 Principais Insights Identificados

13,34k alarmes analisados

Concentração de eventos em horários específicos (possível correlação com turnos operacionais)

Severidades críticas associadas a tipos específicos de alarmes

Indícios de correlação com ciclos de manutenção

Padrões sazonais que sugerem impacto operacional previsível

## 📈 Valor de Negócio

A análise permite:

Priorização de alarmes críticos

Redução de alarmes redundantes

Planejamento de manutenção preventiva

Redução de downtime operacional

Melhoria no tempo de resposta a incidentes

Apoio à tomada de decisão orientada por dados

## 🧠 Competências Demonstradas

ETL com Power Query (M)

Modelagem analítica para BI

Análise temporal

Tratamento de dados

Storytelling com dados

Organização de projeto (Raw → Transformação → Consumo)
