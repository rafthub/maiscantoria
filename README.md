# Projeto Mais Cantoria — versão estática

Conversão do site WordPress (Elementor) para HTML/CSS/JS puro, sem
necessidade de servidor PHP/MySQL. Pronto para publicar em **Firebase
Hosting** ou **Vercel**, ambos com plano gratuito generoso o bastante
para um site institucional deste tamanho.

## Estrutura

```
/
├── index.html              → Para Empresas (home)
├── escolas.html             → Para Escolas
├── entre-em-contato.html    → Entre em Contato
├── eliane-aquino.html       → Currículo da regente
├── ricco-nunes.html         → Currículo do regente
├── 404.html
├── firebase.json
├── vercel.json
└── assets/
    ├── css/style.css
    ├── js/main.js
    └── img/                → (colocar favicon.png aqui)
```

## ⚠️ Sobre as imagens — passo obrigatório antes de publicar

Todos os arquivos `.html` já foram atualizados para referenciar as
imagens localmente (`/assets/img/...`), mas **os arquivos de imagem em
si ainda não estão dentro da pasta** — eu não tenho acesso à internet
neste ambiente para baixá-los por você. Sem esse passo, as imagens vão
quebrar assim que você desligar o WordPress.

Escolha uma opção:

**Opção A — rodar o script (mais rápido)**
Na raiz do projeto:
```bash
bash download-images.sh
```
(Windows/PowerShell: `./download-images.ps1`)

Isso baixa as 8 imagens usadas no site direto do servidor WordPress
atual e salva em `assets/img/` com os nomes certos — os HTMLs já
apontam para eles.

**Opção B — baixar manualmente**
Acesse o painel/FTP do WordPress, entre em `wp-content/uploads/`, e
baixe estes arquivos, salvando com os nomes indicados em `assets/img/`:

| Arquivo original | Salvar como |
|---|---|
| `2023/08/Choir-1-768x461.gif` | `choir-hero.gif` |
| `2023/08/41208591501_19d72d642c_o-1024x683.jpg` | `coral-apresentacao.jpg` |
| `2021/03/ElianeAquino-768x1024.jpeg` | `eliane-aquino.jpeg` |
| `2021/03/Ricco.jpg` | `ricco-nunes.jpg` |
| `2023/08/kids-being-part-sunday-school-768x548.jpg` | `escolas-hero.jpg` |
| `2023/08/group-actors-dark-colored-clothes-rehearsal-theater_146671-50968.jpg` | `escolas-ensaio.jpg` |
| `2023/08/oakcrest-choir-rui_barros_photography.webp` | `escolas-apresentacao.webp` |
| `2021/03/cropped-FAVICON_Projeto-Cantoria2-270x270.png` | `favicon.png` |

**Opção C — me envie os arquivos aqui no chat** e eu coloco tudo no
lugar certo e reempacoto o projeto para você.

Rode isso **antes** do `firebase deploy` / `vercel --prod`, para as
imagens já irem publicadas junto.

## Publicar no Firebase Hosting (gratuito)

```bash
npm install -g firebase-tools
firebase login
firebase init hosting   # aponte o "public directory" para a raiz deste projeto
firebase deploy
```

O arquivo `firebase.json` já vem configurado (URLs limpas, cache de
assets). Você receberá uma URL do tipo `seu-projeto.web.app`; depois
é só apontar seu domínio `maiscantoria.com.br` para o Firebase nas
configurações de DNS do seu registrador (Firebase Console → Hosting →
Adicionar domínio personalizado).

## Publicar na Vercel (gratuito)

Opção A — pelo site:
1. Crie uma conta em vercel.com e clique em "Add New Project".
2. Suba esta pasta (ou conecte um repositório Git com estes arquivos).
3. Como é HTML puro, não é necessário configurar build command nem
   output directory — a Vercel detecta automaticamente.

Opção B — pelo terminal:
```bash
npm install -g vercel
vercel login
vercel --prod
```

Depois, em Project Settings → Domains, adicione
`maiscantoria.com.br` e siga as instruções de DNS.

## Migração de domínio e SEO

- Mantenha as mesmas URLs (`/`, `/escolas.html`, `/entre-em-contato.html`,
  `/eliane-aquino.html`, `/ricco-nunes.html`) o mais parecidas possível
  com as antigas para não perder posicionamento no Google. Se preferir
  manter exatamente `/escolas/` (com barra, sem `.html`), tanto o
  Firebase (`cleanUrls`) quanto a Vercel já estão configurados para
  aceitar as duas formas.
- Depois de publicar, use o Google Search Console para reenviar o
  sitemap e confirmar que as páginas antigas redirecionam (ou
  coincidem) com as novas.
- As meta tags de título/descrição de cada página já foram trazidas
  do site original.

## O que NÃO foi migrado (não existia de fato)

- Comentários/CMS dinâmico — o site original é 100% estático, gerado
  pelo Elementor, sem loja, blog ou área logada.
- O formulário de "depoimentos" na home era um placeholder do tema
  (texto Lorem Ipsum, sem dado real) — removido nesta versão. Se você
  tiver depoimentos reais de participantes, posso adicionar uma seção
  de carrossel simples com eles.
