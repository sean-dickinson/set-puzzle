<script setup lang="ts">
import { useForm } from '@inertiajs/vue3';

const { token } = defineProps<{ token: string }>();

const form = useForm({
  password: '',
  password_confirmation: ''
});

function submit() {
  form.put(`/password/${token}`);
}
</script>
<template>
  <section class="password-edit-page">
    <div class="password-edit-form">
      <h1>Update your password</h1>
      <form @submit.prevent="submit">
        <div class="form-control">
          <label for="password">New password</label>
          <input
            id="password"
            type="password"
            v-model="form.password"
            required
            autocomplete="new-password"
            placeholder="Enter new password"
            maxlength="72"
          />
        </div>
        <div class="form-control">
          <label for="password_confirmation">Repeat new password</label>
          <input
            id="password_confirmation"
            type="password"
            v-model="form.password_confirmation"
            required
            autocomplete="new-password"
            placeholder="Repeat new password"
            maxlength="72"
          />
        </div>
        <button type="submit">Save</button>
      </form>
    </div>
  </section>
</template>

<style>
.password-edit-page {
  display: grid;
  place-items: center;
  grid-template-columns: repeat(3, 1fr);
  min-height: 100vh;
}

.password-edit-form {
  display: flex;
  flex-direction: column;
  gap: 1rem;
  padding: 2rem;
  border: 1px solid #ccc;
  border-radius: 0.5rem;
  background-color: #f9f9f9;
  grid-column: 2 / 3;
  width: 100%;
  max-width: 600px;
}

.form-control {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  padding-bottom: 1rem;
}
</style>

