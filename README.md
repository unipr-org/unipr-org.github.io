## Esecuzione in locale

Prima di eseguire in locale il nostro sito dobbiamo:
1. Installare [Jekyll](https://jekyllrb.com/docs/installation/).
2. Installare [Ruby](https://www.ruby-lang.org/en/documentation/installation/).
3. Installare [Bundle](https://bundler.io/) (dovrebbe installarsi da solo con l'installazione di Ruby).
4. *[Opzionale]* Creare un [sito Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll) per il supporto della live preview. Questo progetto è stato creato in questo modo.

Successivamente, eseguiamo i comandi nella directory che contiene il progetto:
```bash
bundle install
bundle add webrick
bundle exec jekyll serve
```

Ora possiamo vedere una preview del sito al seguente indirizzo `http://localhost:4000`.

---

## Supporto per Latex
Aggiungere nella sezione `<head>` del file `_layouts/default.html` il seguente script:
```html
<script type="text/x-mathjax-config">
    MathJax.Hub.Config({
        tex2jax: {
        skipTags: ['script', 'noscript', 'style', 'textarea', 'pre'],
        inlineMath: [['$','$']]
        }
    });
</script>
<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script> 
```

Ora è possibile utilizzare formule latex con la stessa sintassi di Obsidian: \$*{formula_in_LaTeX}*\$.

---

## Supporto per ToC (Table of Content)
Aggiungere nel file `_config.yml` la seguente configurazione:
```yaml
markdown: kramdown
```

Ora è possibile far generare un indice dinamico aggiungendo le seguenti righe di codice all'inizio del file `index.md` interessato:
```
* Table of Content
{:toc}
```
