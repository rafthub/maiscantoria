#!/bin/bash
# Baixa as imagens do site antigo e salva em assets/img/
# Rode este script a partir da RAIZ do projeto (onde está o index.html)

set -e
mkdir -p assets/img
cd assets/img

curl -L -o choir-hero.gif "https://www.maiscantoria.com.br/wp-content/uploads/2023/08/Choir-1-768x461.gif"
curl -L -o coral-apresentacao.jpg "https://www.maiscantoria.com.br/wp-content/uploads/2023/08/41208591501_19d72d642c_o-1024x683.jpg"
curl -L -o eliane-aquino.jpeg "https://www.maiscantoria.com.br/wp-content/uploads/2021/03/ElianeAquino-768x1024.jpeg"
curl -L -o ricco-nunes.jpg "https://www.maiscantoria.com.br/wp-content/uploads/2021/03/Ricco.jpg"
curl -L -o escolas-hero.jpg "https://www.maiscantoria.com.br/wp-content/uploads/2023/08/kids-being-part-sunday-school-768x548.jpg"
curl -L -o escolas-ensaio.jpg "https://www.maiscantoria.com.br/wp-content/uploads/2023/08/group-actors-dark-colored-clothes-rehearsal-theater_146671-50968.jpg"
curl -L -o escolas-apresentacao.webp "https://www.maiscantoria.com.br/wp-content/uploads/2023/08/oakcrest-choir-rui_barros_photography.webp"
curl -L -o favicon.png "https://www.maiscantoria.com.br/wp-content/uploads/2021/03/cropped-FAVICON_Projeto-Cantoria2-270x270.png"

echo ""
echo "Pronto! 8 imagens baixadas em assets/img/"
echo "O site já está configurado para usar esses arquivos locais."
