<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les objets</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les objets</h1>
<form action="#" method="post">
    <p>Saisir un nom : <input type="text" name="nom"></p>
    <p>Saisir un âge : <input type="text" name="age"></p>
    <p><input type="submit" value="Créer la personne"></p>
</form>

<%!
    class Personne {
        private String nom;
        private int age;

        public String getNom() { 
            return nom; 
        }
        public void setNom(String nom) { 
            this.nom = nom; 
        }
        public int getAge() { 
            return age; 
        }
        public void setAge(int age) { 
            this.age = age; 
        }

        public String seDecrire() {
            return "Je m'appelle " + nom + " et j'ai " + age + " ans.";
        }
    }

    class Voiture {
        String marque;
        String modele;
        int annee;

        public Voiture(String marque, String modele, int annee){
            this.marque = marque;
            this.modele = modele;
            this.annee = annee;
        }
    }

    class Rectangle {
        int longueur;
        int largeur;

        public int calculerSurface() {
            return longueur * largeur;
        }
    }

    class CompteBancaire {
        double solde = 0;

        public void deposer(double montant) {
            solde += montant;
        }

        public void retirer(double montant) {
            solde -= montant;
        }
    }
%>

<% String nom = request.getParameter("nom"); %>
<% String age = request.getParameter("age"); %>

<% if (nom != null && age != null && !nom.isEmpty() && !age.isEmpty()) { %>

    <% Personne p = new Personne(); %>
    <% p.setNom(nom); %>
    <% p.setAge(Integer.parseInt(age)); %>

    <p>Objet Personne créé !</p>
    <p>Nom : <%= p.getNom() %></p>
    <p>Age : <%= p.getAge() %> ans</p>

<h2>Exercice 1 : La classe Voiture</h2>
<p>Créer une classe <code>Voiture</code> avec les attributs <code>marque</code>, <code>modele</code> et <code>annee</code>.</br>
Instancier une voiture, lui affecter des valeurs et afficher ses caractéristiques.</p>

<%
    Voiture porsche = new Voiture("Porsche", "911", 2023);
%>
<p>Voiture de marque <%= porsche.marque %>, modèle <%= porsche.modele %>, année <%= porsche.annee %></p>

<h2>Exercice 2 : Ajouter une méthode à la classe Personne</h2>
<p>Ajouter à la classe <code>Personne</code> une méthode <code>seDecrire()</code> qui retourne une chaîne du type :</br>
"Je m'appelle Marie et j'ai 25 ans".</br>
Appeler cette méthode sur l'objet <code>p</code> et afficher le résultat.</p>

<p><%= p.seDecrire() %></p>

<h2>Exercice 3 : La classe Rectangle</h2>
<p>Créer une classe <code>Rectangle</code> avec les attributs <code>longueur</code> et <code>largeur</code>.</br>
Ajouter une méthode <code>calculerSurface()</code> qui retourne la surface du rectangle.</br>
Créer un rectangle de 5 par 3 et afficher sa surface.</p>

<%
    Rectangle rect = new Rectangle();
    rect.longueur = 5;
    rect.largeur = 3;
%>
<p>La surface du rectangle est : <%= rect.calculerSurface() %></p>

<h2>Exercice 4 : Le compte bancaire</h2>
<p>Créer une classe <code>CompteBancaire</code> avec un attribut <code>solde</code>.</br>
Ajouter deux méthodes : <code>deposer(double montant)</code> et <code>retirer(double montant)</code>.</br>
Créer un compte, déposer 100€, retirer 30€, puis afficher le solde final.</p>

<%
    CompteBancaire compte = new CompteBancaire();
    compte.deposer(100);
    compte.retirer(30);
%>
<p>Solde final du compte : <%= compte.solde %> €</p>

<h2>Exercice 5 : L'encapsulation</h2>
<p>Modifier la classe <code>Personne</code> pour rendre les attributs <code>privés</code>.</br>
Ajouter les getters et setters correspondants : <code>getNom()</code>, <code>setNom(...)</code>, <code>getAge()</code>, <code>setAge(...)</code>.</br>
Adapter ensuite le code de la page pour utiliser ces accesseurs au lieu d'accéder directement aux attributs.</p>

<p><em>Fait ! La classe Personne a été modifiée en haut de fichier avec des attributs privés, et le bloc d'instanciation de la page utilise désormais p.setNom() et p.getNom().</em></p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
