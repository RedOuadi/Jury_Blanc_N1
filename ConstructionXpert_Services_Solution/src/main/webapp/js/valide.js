// Fonction de validation du formulaire de projet
function validerFormulaireProjet() {
    var nomProjet = document.getElementById("nom_projet").value;
    var description = document.getElementById("description").value;
    var dateDebut = document.getElementById("date_debut").value;
    var dateFin = document.getElementById("date_fin").value;
    var budget = document.getElementById("budget").value;

    if (nomProjet === "" || description === "" || dateDebut === "" || dateFin === "" || budget === "") {
        alert("Veuillez remplir tous les champs du formulaire.");
        return false;
    }

    // Convertir les dates en objets Date
    var debut = new Date(dateDebut);
    var fin = new Date(dateFin);

    // Vérifier si la date de fin est postérieure à la date de début
    if (fin <= debut) {
        alert("La date de fin doit être postérieure à la date de début.");
        return false;
    }

    return true;
}

// Fonction de validation du formulaire de tâche
function validerFormulaireTache() {
    var description = document.getElementById("description").value;
    var dateDebut = document.getElementById("date_debut").value;
    var dateFin = document.getElementById("date_fin").value;
    var statut = document.getElementById("statut").value;
    var idProjet = document.getElementById("id_projet").value;

    if (description === "" || dateDebut === "" || dateFin === "" || statut === "" || idProjet === "") {
        alert("Veuillez remplir tous les champs du formulaire.");
        return false;
    }

    // Convertir les dates en objets Date
    var debut = new Date(dateDebut);
    var fin = new Date(dateFin);

    // Vérifier si la date de fin est postérieure à la date de début
    if (fin <= debut) {
        alert("La date de fin doit être postérieure à la date de début.");
        return false;
    }

    return true;
}

// Fonction de validation du formulaire de ressource
function validerFormulaireRessource() {
    var nom = document.getElementById("nom").value;
    var type = document.getElementById("type").value;
    var quantite = document.getElementById("quantite").value;
    var fournisseur = document.getElementById("fournisseur").value;
    var idTache = document.getElementById("id_tache").value;

    if (nom === "" || type === "" || quantite === "" || fournisseur === "" || idTache === "") {
        alert("Veuillez remplir tous les champs du formulaire.");
        return false;
    }

    return true;
}



