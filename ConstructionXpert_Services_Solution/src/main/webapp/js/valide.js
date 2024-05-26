function validerFormulaireProjet(event) {
    event.preventDefault(); // Empêcher la soumission du formulaire

    var nomProjet = document.getElementById("nom_projet").value;
    var description = document.getElementById("description").value;
    var dateDebut = document.getElementById("date_debut").value;
    var dateFin = document.getElementById("date_fin").value;
    var budget = document.getElementById("budget").value;

    var messageErreur = document.getElementById("message-erreur");
    messageErreur.textContent = ""; // Réinitialiser le message d'erreur

    if (nomProjet === "" || description === "" || dateDebut === "" || dateFin === "" || budget === "") {
        messageErreur.textContent = "Veuillez remplir tous les champs du formulaire.";
        messageErreur.style.color = "red";
        return;
    }

    // Convertir les dates en objets Date
    var debut = new Date(dateDebut);
    var fin = new Date(dateFin);

    // Vérifier si la date de fin est postérieure à la date de début
    if (fin <= debut) {
        messageErreur.textContent = "La date de fin doit être postérieure à la date de début.";
        messageErreur.style.color = "red";
        return;
    }

    // Si toutes les validations sont réussies, soumettre le formulaire
    event.target.submit();
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



