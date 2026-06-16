# Spec — Camada de Cache Coesa (Gibifolio)

> Status: **Draft / aguardando implementação**
> Escopo: **Large** (multi-componente, 4 frentes) · Stack: Flutter + FlutterFlow + Supabase
> Branch de trabalho: `flutterflow`

## 1. Visão geral

Implementar uma camada de cache coesa para o Gibifolio cobrindo quatro frentes —
imagens (capas), dados do Supabase, suporte offline e invalidação/limpeza — de forma
que **sobreviva ao ciclo de export do FlutterFlow** e **degrade graciosamente** (cache
corrompido ou indisponível nunca pode derrubar o app).

## 2. Objetivos / Não-objetivos

**Objetivos**
- Capas persistidas em disco (hoje só há cache em memória) com política explícita.
- Leituras pesadas (releases, biblioteca, listas) servidas instantaneamente do cache local,
  com revalidação em background (stale-while-revalidate).
- App utilizável offline com dados/imagens já cacheados, com aviso discreto.
- Invalidação consistente quando o usuário altera status (lido/quero/tenho) + ação manual de
  "Limpar cache" com tamanho em disco.

**Não-objetivos**
- Sincronização offline-write (fila de mutações offline). Offline é **read-only** nesta fase.
- Reescrever a UI gerada ou o roteamento.
- Substituir os `FutureRequestManager` em memória do `app_state.dart` (são gerados; coexistem).
- Adicionar `connectivity_plus` nesta fase (ver NFR-04 / decisão registrada).

## 3. Restrição central — Preservação no ciclo FlutterFlow

> Esta é a restrição que governa toda a arquitetura. Ver `design.md §2 (Protocolo de Preservação)`.

- **CON-01** — Nenhum arquivo gerado pode ser editado de forma que se perca no próximo export.
  Arquivos editáveis são **somente**: `lib/custom_code/actions/**`, `lib/custom_code/widgets/**`,
  `lib/flutter_flow/custom_functions.dart` (confirmado por `analysis_options.yaml`).
- **CON-02** — Todo arquivo novo deve corresponder a **um** Custom Action ou Custom Widget
  **registrado no FlutterFlow**. Código compartilhado (singletons/serviços) reside como código
  top-level *dentro* de um arquivo registrado. **Proibido** arquivo solto de helper que o
  FlutterFlow não conheça (seria apagado no export).
- **CON-03** — Toda alteração de "wiring" em página/componente gerado (ex.: trocar a fonte de
  dados de um `FutureBuilder`, inserir um widget no settings) é feita **no FlutterFlow**, não no
  código aqui. O spec/design entrega o código; a planilha de wiring (design §8) lista o que o
  humano faz no FF.
- **CON-04** — Cada entrega deixa registrado, por arquivo, o **tipo de registro no FF**
  (Action/Widget) para o round-trip (design §6).

## 4. Requisitos funcionais

### Frente 1 — Cache de imagens (capas)
- **FR-IMG-01** — Existe um `CacheManager` customizado dedicado a capas, com política explícita:
  `stalePeriod = 30 dias`, `maxNrOfCacheObjects = 1000`, store em disco.
- **FR-IMG-02** — O render da capa em `comic_cover.dart` usa esse CacheManager. _(Hoje a capa usa
  `Image.network` e o preload usa `NetworkImage` → só memória; ambos passam a usar o provider
  cacheado em disco.)_
- **FR-IMG-03** — O preload (`_preloadCheck`) e o overlay de brilho (gloss) usam o mesmo CacheManager.
- **FR-IMG-04** — Placeholder de carregamento, fallback de erro e o placeholder +18 (restrito)
  continuam funcionando exatamente como hoje.
- **FR-IMG-05** — Existe uma action `prefetchCovers(List<String> urls)` para pré-carregar capas das
  próximas telas (listas/biblioteca). Idempotente, tolerante a URL nula/vazia, não bloqueante.

### Frente 2 — Cache de dados Supabase (stale-while-revalidate)
- **FR-DATA-01** — Existe um serviço de cache local em Hive (envelope `{data, cachedAt}`), com
  API tipada: `read<T>`, `write<T>`, `isFresh(key, ttl)`, `evict(key)`, `clearAll`.
- **FR-DATA-02** — Action `getCachedReleases()` serve releases do cache imediatamente e revalida
  em background, persistindo o resultado fresco.
- **FR-DATA-03** — Action `getCachedLibrary(userId)` serve a biblioteca do cache imediatamente e
  revalida em background, atualizando `FFAppState().libraryTitles` (live SWR via Consumer).
- **FR-DATA-04** — Action `getCachedLists(userId)` análoga para as listas do usuário.
- **FR-DATA-05** — A API pública das actions é simples e tipada; a assinatura não vaza detalhe de
  storage (Hive) para o chamador.

### Frente 3 — Suporte offline
- **FR-OFF-01** — Falha de rede (ex.: `SocketException`, timeout) é detectada e tratada como
  offline; as actions de cache retornam o dado cacheado (mesmo expirado), marcado como stale.
- **FR-OFF-02** — Estado offline é exposto de forma simples (`FFAppState().isOffline`, campo a ser
  adicionado **no FlutterFlow**) e um widget `OfflineBanner` discreto pode ser inserido nas telas.
- **FR-OFF-03** — Ao primeiro fetch bem-sucedido após período offline, o estado volta a online e as
  views visíveis são revalidadas (re-fetch simples; sem fila persistente).
- **FR-OFF-04** — Nenhuma tela quebra offline: ausência de dados cacheados mostra os
  placeholders/skeletons já existentes.

### Frente 4 — Invalidação e limpeza
- **FR-INV-01** — TTL por tipo de dado conforme a matriz (design §7). 
- **FR-INV-02** — Ao alterar status de issue/título (lido/quero/tenho), o cache da biblioteca e do
  título afetado é invalidado, mantendo consistência com o estado. Hook nas actions já editáveis:
  `updateReadingStatus`, `updateOwnershipStatus`, `upsertIssueStatus`, `upsertTitleStatus`,
  `bulkUpdateIssueReadingStatus`, `bulkUpdateIssueOwnershipStatus`,
  `updateTitleReadingStatus`, `updateTitleOwnershipStatus`.
- **FR-INV-03** — Action `clearAppCache()` zera o cache de imagens (CacheManager) **e** os dados
  (boxes Hive).
- **FR-INV-04** — Action/função `getCacheSizeLabel()` retorna o tamanho atual em disco
  (imagens + Hive), formatado (ex.: "12,4 MB").
- **FR-INV-05** — Existe um widget `CacheSettingsTile` (tamanho + botão "Limpar cache") auto-contido
  para inserção na tela de configurações **via FlutterFlow**.

## 5. Requisitos não-funcionais

- **NFR-01 (Resiliência)** — Qualquer erro de cache (corrompido, box inacessível, JSON inválido) é
  capturado e degrada para fetch normal; o app **nunca** crasha por causa do cache.
- **NFR-02 (Init lazy)** — Inicialização do Hive é lazy e idempotente (não pode depender de
  `main.dart`, que é gerado). Usa `Hive.init(path)` + `path_provider` — **sem** `hive_flutter`.
- **NFR-03 (Conteúdo adulto)** — O controle `isAdult/canSeeAdult` continua na renderização e o cache
  guarda o dado cru; a UI filtra como já faz. Capas restritas (+18) não são pré-carregadas para
  usuários sem permissão.
- **NFR-04 (Sem libs novas)** — Nenhuma dependência nova por padrão. Tudo é coberto por pacotes já no
  `pubspec.yaml` (`flutter_cache_manager`, `cached_network_image`, `hive`, `path_provider`).
  `connectivity_plus` fica como upgrade opcional futuro (banner proativo), fora desta fase.
- **NFR-05 (API tipada)** — Assinaturas públicas das actions simples e tipadas; sem `dynamic`
  desnecessário no contrato.
- **NFR-06 (Análise limpa)** — `flutter analyze` sem novos warnings.

## 6. Critérios de aceite / verificação

- **AC-01** — `flutter analyze` sem novos warnings; `flutter test` (smoke `widget_test.dart`) passa.
- **AC-02 (cold start offline)** — Com app já aberto uma vez online, reabrir **sem rede** mostra
  capas e dados cacheados (releases/biblioteca/listas), com banner offline discreto.
- **AC-03 (invalidação por status)** — Marcar um issue/título como lido/quero/tenho invalida o cache
  certo: a próxima leitura da biblioteca/título reflete a mudança sem dado obsoleto.
- **AC-04 (limpar cache)** — O botão "Limpar cache" zera disco (imagens + Hive); o tamanho exibido
  vai a ~0 e as próximas telas re-buscam do Supabase.
- **AC-05 (preservação)** — Nenhum arquivo gerado foi modificado de forma perdível; cada arquivo novo
  tem seu registro no FlutterFlow documentado (design §6). Checklist de round-trip preenchido.

## 7. Fora de escopo (nesta fase)
- Escrita offline / fila de mutações persistente.
- Banner offline proativo baseado em eventos de conectividade (`connectivity_plus`).
- Cache de busca/autocomplete (volátil; baixo retorno).
- Migração dos `FutureRequestManager` em memória do `app_state.dart`.

## 8. Rastreabilidade

Cada requisito acima é endereçado por um componente em `design.md §6` e por uma tarefa na frente
correspondente. As frentes são entregues e validadas **uma por vez**, em commits separados.
