<script setup lang="ts">
const config = useRuntimeConfig()

interface Recette {
  nom: string
  region: string
  difficulte: string
}

const { data: recettes, pending, error } = await useFetch<Recette[]>(
  `${config.public.apiUrl}/recettes`
)
</script>

<template>
  <div style="font-family: sans-serif; max-width: 800px; margin: 2rem auto; padding: 0 1rem;">
    <h1>La Brigade du Code 🍳</h1>
    <p style="color: #666;">Recettes du Chef</p>

    <div v-if="pending">Chargement...</div>
    <div v-else-if="error" style="color: red;">
      Erreur: impossible de contacter le backend ({{ config.public.apiUrl }})
    </div>

    <table v-else style="width: 100%; border-collapse: collapse; margin-top: 1rem;">
      <thead>
        <tr style="background: #2c3e50; color: white;">
          <th style="padding: 0.75rem; text-align: left;">Recette</th>
          <th style="padding: 0.75rem; text-align: left;">Region</th>
          <th style="padding: 0.75rem; text-align: left;">Difficulte</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(recette, i) in recettes"
          :key="recette.nom"
          :style="{ background: i % 2 === 0 ? '#f9f9f9' : 'white' }"
        >
          <td style="padding: 0.75rem; font-weight: bold;">{{ recette.nom }}</td>
          <td style="padding: 0.75rem; color: #666;">{{ recette.region }}</td>
          <td style="padding: 0.75rem;">
            <span :style="{
              background: recette.difficulte === 'difficile' ? '#e74c3c' :
                          recette.difficulte === 'moyen' ? '#f39c12' : '#27ae60',
              color: 'white',
              padding: '0.2rem 0.5rem',
              borderRadius: '4px',
              fontSize: '0.85rem'
            }">{{ recette.difficulte }}</span>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
