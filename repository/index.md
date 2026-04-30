---
layout: default
title: Archivio Repository
permalink: /repository/
---

# Archivio Repository Appunti

> **Nota importante:** Questo elenco include **solo i repository attualmente esistenti** nell'organizzazione GitHub.
>
> *Le materie sono organizzate secondo l'ultimo Piano di Studi (2025/26).*

---

<input type="text" id="repoSearch" onkeyup="filterRepos()" placeholder="Cerca una materia (es: Algoritmi)..." style="width: 100%; padding: 12px; margin-bottom: 20px; border-radius: 8px; border: 2px solid #0066cc; font-size: 16px;">

<div id="noResults" style="display: none; color: #666; font-style: italic; margin-top: 20px; padding: 20px; background: #f9f9f9; border-radius: 8px; text-align: center;">
  Nessuna materia trovata con questo nome.
</div>

## 🟢 Primo Anno
*Materie di base per le nuove matricole.*

* **[[FdP-A] Fondamenti di Programmazione A](https://github.com/unipr-org/FdP-A)** (6 CFU)
* **[[FdP-B] Fondamenti di Programmazione B](https://github.com/unipr-org/FdP-B)** (9 CFU)
* **[[EdL] Elementi di Logica e Strutture Discrete](https://github.com/unipr-org/EdL)** (6 CFU)
* **[[ASD] Algoritmi e Strutture Dati](https://github.com/unipr-org/ASD)** (9 CFU)

## 🟡 Secondo Anno
*Sviluppo, basi di dati e sistemi.*

* **[[SO] Sistemi Operativi](https://github.com/unipr-org/SO)** (9 CFU)
* **[[BdD] Basi di Dati](https://github.com/unipr-org/BdD)** (9 CFU)
* **[[MdP] Metodologie di Programmazione](https://github.com/unipr-org/MdP)** (6 CFU)
* **[[CN] Calcolo Numerico](https://github.com/unipr-org/CN)** (6 CFU)
* **[[FdI] Fondamenti di Informatica](https://github.com/unipr-org/FdI)** (9 CFU)
* **[[ASD-Lab] Laboratorio di Algoritmi e Strutture Dati](https://github.com/unipr-org/ASD)** (6 CFU)

## 🔴 Terzo Anno
*Corsi specialistici e a scelta.*

* **[[IdS] Ingegneria del Software](https://github.com/unipr-org/IdS)** (9 CFU)
* **[[RdC] Reti di Calcolatori](https://github.com/unipr-org/RdC)** (9 CFU)
* **[[PM] Programmazione Mobile](https://github.com/unipr-org/PM)** (6 CFU)
* **[[ASC] Amministrazione Sistemi IT e Cloud](https://github.com/unipr-org/ASC)** (6 CFU)
* **[[PoaM] Programmazione orientata ai Microservizi](https://github.com/unipr-org/PoaM)** (6 CFU)
* **[[HPC] Programmazione Parallela e HPC](https://github.com/unipr-org/HPC)** (6 CFU)

## 🟣 Laurea Magistrale
*Corsi avanzati di Scienze Informatiche.*

* **[[AI] Intelligenza Artificiale](https://github.com/unipr-org/AI)** (6 CFU)
* **[[AIA] Algoritmi per l'IA](https://github.com/unipr-org/AIA)** (6 CFU)
* **[[LIA] Laboratorio di Intelligenza Artificiale](https://github.com/unipr-org/LIA)** (6 CFU)
* **[[ML] Machine Learning](https://github.com/unipr-org/ML)** (6 CFU)
* **[[ASVS] Analisi Statica e Verifica Software](https://github.com/unipr-org/ASVS)** (9 CFU)
* **[[LIeC] Linguaggi, Interpreti e Compilatori](https://github.com/unipr-org/LIeC)** (9 CFU)
* **[[SI] Sicurezza Informatica](https://github.com/unipr-org/SI)** (6 CFU)
* **[[FdAI] Fondamenti di Intelligenza Artificiale](https://github.com/unipr-org/FdAI)** (6 CFU)
* **[[BDDM] Big Data e Data Mining](https://github.com/unipr-org/BDDM)** (6 CFU)
* **[[PD] Programmazione Dichiarativa](https://github.com/unipr-org/PD)** (6 CFU)
* **[[QC] Quantum Computing](https://github.com/unipr-org/QC)** (6 CFU)
* **[[MSN] Modellazione e Sim. Numeriche](https://github.com/unipr-org/MSN)** (6 CFU)
* **[[DoRSSS] Development of Reliable, Safe and Secure Software](https://github.com/unipr-org/DoRSSS)** (6 CFU)

---

## Risorse Trasversali
* **[[Tutorati] Materiale Esercitazioni](https://github.com/unipr-org/tutorati)**
* **[[LaTeX Thesis Template] Modello Tesi](https://github.com/unipr-org/template-tesi)**

---

### Non trovi la tua materia?
Se hai degli appunti da condividere, consulta la nostra **[Guida al Contributo](https://github.com/unipr-org)**.

<button id="backToTop" onclick="window.scrollTo({top: 0, behavior: 'smooth'})" style="display:none; position: fixed; bottom: 20px; right: 20px; z-index: 99; border: none; outline: none; background-color: #0066cc; color: white; cursor: pointer; padding: 10px 15px; border-radius: 50px; font-weight: bold; box-shadow: 0 4px 8px rgba(0,0,0,0.2);">↑ Su</button>


<script>
function filterRepos() {
  let input = document.getElementById('repoSearch').value.toUpperCase();
  let sections = document.querySelectorAll('h2');
  let noResults = document.getElementById('noResults');
  let globalFound = false;

  sections.forEach(section => {
    // Trova la lista UL e l'eventuale paragrafo descrittivo associati alla sezione
    let sibling = section.nextElementSibling;
    let description = null;
    let list = null;

    while (sibling && sibling.tagName !== 'H2' && !list) {
      if (sibling.tagName === 'P') description = sibling;
      if (sibling.tagName === 'UL') list = sibling;
      sibling = sibling.nextElementSibling;
    }

    if (list) {
      let items = list.querySelectorAll('li');
      let sectionFound = false;

      items.forEach(item => {
        let text = item.textContent || item.innerText;
        if (text.toUpperCase().includes(input)) {
          item.style.display = "";
          sectionFound = true;
          globalFound = true;
        } else {
          item.style.display = "none";
        }
      });

      // Nascondi/Mostra titolo, descrizione e lista in base ai risultati
      let displayState = sectionFound ? "" : "none";
      section.style.display = displayState;
      if (description) description.style.display = displayState;
      list.style.display = displayState;
    }
  });

  // Mostra messaggio "Nessun risultato" se non è stato trovato nulla in tutta la pagina
  noResults.style.display = globalFound ? "none" : "";
}

// Forza l'apertura dei link in una nuova scheda
document.querySelectorAll('a').forEach(link => {
  if (link.hostname.includes('github.com')) {
    link.setAttribute('target', '_blank');
    link.setAttribute('rel', 'noopener noreferrer');
  }
});
window.onscroll = function() {
  if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
    document.getElementById("backToTop").style.display = "block";
  } else {
    document.getElementById("backToTop").style.display = "none";
  }
};
</script>

