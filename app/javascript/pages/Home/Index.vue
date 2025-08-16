<script setup lang="ts">

import type {SetCard} from "@/types/set-types.ts";
import Card from "@/components/Card.vue";
import { Link } from "@inertiajs/vue3";

type TodayPuzzle = {
  card: SetCard,
  date: string;
}

const {today} = defineProps<{
  today: TodayPuzzle
}>();
</script>
<template>
  <main>
    <section class="today">
      <div class="today__header">
        <h1>Daily Set Puzzle</h1>
        <h2>Play Today's Puzzle</h2>
      </div>
      <Link class="today__card" href="/daily-puzzle">
        <Card v-bind="today.card" />
      </Link>
    </section>
  </main>
</template>

<style>
.today {
  display: grid;
  grid-template-columns: 1fr 1fr;
  place-content: center;
  height: 100dvh;

  & .today__header, & .today__card {
    display: grid;
    place-content: center;
    text-align: center;

  }

}
</style>
