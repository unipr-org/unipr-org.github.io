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
