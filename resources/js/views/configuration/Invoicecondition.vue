<template>
  <div class="app-container">
    <Tinymce v-model="invoicecondition" />
    <el-button v-model="submit" @click="handleCondition">Submit</el-button>
  </div>
</template>

<script>
import Tinymce from '@/components/Tinymce/index';
// import { months } from 'moment';
export default {
  components: { Tinymce },
  data() {
    return {
      invoicecondition: '',
    };
  },
  methods: {
    handleCondition() {
    },
  },
};
</script>
