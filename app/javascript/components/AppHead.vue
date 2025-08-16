<script setup lang="ts">
import { Head } from '@inertiajs/vue3'
import {computed} from "vue";

const {title} = defineProps<{title?: string}>()
const baseTitle = 'Set Puzzle';

const fullTitle = computed(() => title ? `${title} - ${baseTitle}` : baseTitle);
</script>

<template>
  <Head :title="fullTitle">
    <slot />
  </Head>
</template>