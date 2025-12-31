# Respectons (enfin) l'article 25 du RGPD avec PostgreSQL Anonymiser

## Description

Ce dépôt présente l'ensemble des sources de la conférence `Respectons (enfin) l'article 25 du RGPD avec PostgreSQL Anonymiser`

## Générer les slides en local

1. Télécharger `reveal.js`, le dézipper à la racine du projet et nommer le répertoire `reveal.js` : https://github.com/hakimel/reveal.js/archive/master.zip

2. Générer les slides :
```sh
docker run --rm -v $(pwd -W):/documents asciidoctor/docker-asciidoctor asciidoctor-revealjs index.adoc
```

3. Ouvrir le fichier `index.html` généré.
