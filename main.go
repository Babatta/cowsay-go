package main

import (
	"fmt"
	"log"

	cowsay "github.com/Code-Hex/Neo-cowsay/v2"
)

func main() {
	// Message à afficher avec la vache
	message := "Hello, Go World!"

	// Génère le message cowsay
	cow, err := cowsay.Say(
		message,                // Le texte que la vache dira
		cowsay.Type("default"), // Le type de vache (peut être changé, par ex. "dragon")
	)
	if err != nil {
		log.Fatalf("Erreur lors de la génération de la vache : %v", err)
	}

	// Affiche la vache
	fmt.Println(cow)
}
