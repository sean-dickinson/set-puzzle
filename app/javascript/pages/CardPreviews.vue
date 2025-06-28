<script setup lang="ts">
import {getAttributeOptions, ATTRIBUTES} from "@/set_game/cardHelpers.ts";
import type {SetCard} from "@/types/set-types";
import Card from "@/components/Card.vue";
import {ref} from "vue";

const selectedAttributes = ref<Omit<SetCard, 'number'>>({
  shade: 'solid',
  shape: 'oval',
  color: 'red'
});

const attributesWithoutNumber = ATTRIBUTES.filter(attr => attr !== 'number');

</script>

<template>
  <section class="card-previews">
    <h1>Card Previews</h1>
    <div class="card-configuration">
      <select v-for="attribute in attributesWithoutNumber" :name="attribute" :id="attribute"
              v-model="selectedAttributes[attribute]">
        <option v-for="option in getAttributeOptions(attribute)" :value="option" :key="option">
          {{ option }}
        </option>
      </select>
    </div>
    <div class="card-container">
      <Card v-for="number in 3" v-bind="selectedAttributes" :number="number"/>
    </div>
  </section>
</template>

<style scoped>
.card-previews {
  display: grid;
  grid-template-rows: max-content 2rem 1fr;
  gap: 1rem;
  height: 100dvh;
  place-items: center;
}

.card-configuration {
  display: flex;
  gap: 1rem;
}

.card-container {
  width: 100%;
  max-width: 800px;
  display: grid;
  place-items: center;
  grid-template-columns: repeat(3, 1fr);
  gap: 1rem;
  padding: 1rem;
}
</style>